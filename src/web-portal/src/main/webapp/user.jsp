<%-- 
    Document   : user.jsp
    Created on : Feb 27, 2017, 7:05:47 PM
    Author     : Francisco Correia {@literal <https://github.com/fjrcorreia>}
--%>

<%@page import="java.util.Iterator" %>
<%@page import="java.util.Set" %>
<%@page import="org.keycloak.representations.AccessToken" %>
<%@page import="java.util.Collections" %>
<%@page import="org.keycloak.representations.idm.authorization.Permission" %>
<%@page import="java.util.List" %>
<%@page import="org.keycloak.representations.IDToken" %>
<%@page import="org.keycloak.KeycloakPrincipal" %>
<%@page import="java.security.Principal" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<%
    Principal principal = request.getUserPrincipal();
    KeycloakPrincipal user = null;


    if (principal != null && principal instanceof KeycloakPrincipal) {
        user = (KeycloakPrincipal) principal;
    }
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>User Class: <%=(principal != null ? principal.getClass().getCanonicalName() : "No User Found!")%>
    <h1>User Info: <%=(principal != null ? user.getName() : "No User Name!")%></h1>

        <%
    if (user != null) {

        IDToken identityToken = user.getKeycloakSecurityContext().getIdToken();
        AccessToken token = user.getKeycloakSecurityContext().getToken();
        Set<String> roles = token.getRealmAccess().getRoles();



        List<Permission> permissions;
        if (user.getKeycloakSecurityContext().getAuthorizationContext() != null) {

            log("Authorization Context OK!!");
            permissions = user.getKeycloakSecurityContext().getAuthorizationContext().getPermissions();
            if (permissions == null) {
                log("No Permissions????");
                permissions = Collections.EMPTY_LIST;
            }
        } else {
            log("No Authorization Context????");
            permissions = Collections.EMPTY_LIST;
        }

%>
    <ul>
        <li>Realm: <%=user.getKeycloakSecurityContext().getRealm()%>
        </li>
        <li>User : <%=user.getName()%>
        </li>
        <li>AccessTokenHash: <%=identityToken.getAccessTokenHash()%>
        </li>
        <li>getAcr: <%=identityToken.getAcr()%>
        </li>
        <li>getAddress: <%=identityToken.getAddress()%>
        </li>
        <li>getAudience [<%=identityToken.getAudience().length%>]:</li>
        <%
            for (String audience : identityToken.getAudience()) {
        %>
        <li>getAudience: <%=audience%>
        </li>
        <%
            }
        %>
        <li>getAuthTime: <%=identityToken.getAuthTime()%>
        </li>
        <li>getBirthdate: <%=identityToken.getBirthdate()%>
        </li>
        <li>getClaimsLocales: <%=identityToken.getClaimsLocales()%>
        </li>
        <li>getCodeHash: <%=identityToken.getCodeHash()%>
        </li>
        <li>getEmail: <%=identityToken.getEmail()%>
        </li>
        <li>getEmailVerified: <%=identityToken.getEmailVerified()%>
        </li>
        <li>getExpiration: <%=identityToken.getExpiration()%>
        </li>
        <li>getFamilyName: <%=identityToken.getFamilyName()%>
        </li>
        <li>getGender: <%=identityToken.getGender()%>
        </li>
        <li>getGivenName: <%=identityToken.getGivenName()%>
        </li>
        <li>getId: <%=identityToken.getId()%>
        </li>
        <li>getIssuedFor: <%=identityToken.getIssuedFor()%>
        </li>
        <li>getIssuer: <%=identityToken.getIssuer()%>
        </li>
        <li>getLocale: <%=identityToken.getLocale()%>
        </li>
        <li>getMiddleName: <%=identityToken.getMiddleName()%>
        </li>
        <li>getName: <%=identityToken.getName()%>
        </li>
        <li>getNonce: <%=identityToken.getNonce()%>
        </li>
        <li>getNickName: <%=identityToken.getNickName()%>
        </li>
        <li>getNotBefore: <%=identityToken.getNotBefore()%>
        </li>
        <li>getPhoneNumber: <%=identityToken.getPhoneNumber()%>
        </li>
        <li>getPhoneNumberVerified: <%=identityToken.getPhoneNumberVerified()%>
        </li>
        <li>getPreferredUsername: <%=identityToken.getPreferredUsername()%>
        </li>
        <li>getProfile: <%=identityToken.getProfile()%>
        </li>
        <li>getSessionState: <%=identityToken.getSessionState()%>
        </li>
        <li>getSubject: <%=identityToken.getSubject()%>
        </li>
        <li>getType: <%=identityToken.getType()%>
        </li>
        <li>getUpdatedAt: <%=identityToken.getUpdatedAt()%>
        </li>
        <li>getWebsite: <%=identityToken.getWebsite()%>
        </li>
        <li>getZoneinfo: <%=identityToken.getZoneinfo()%>
        </li>
        <li>getOtherClaims: <%=identityToken.getOtherClaims()%>
        </li>
    </ul>


    <h2>Roles [<%=roles.size()%>]</h2>
    <ul>
        <%
            Iterator<String> it = roles.iterator();
            while (it.hasNext()) {

        %>
        <li>Role: <%=it.next()%>
        </li>
        <% }
        %>
    </ul>


    <h2>Permissions [<%=permissions.size()%>]</h2>
    <ul>
        <%
            for (Permission p : permissions) {

        %>
        <li>ID: <%=p.getResourceSetId()%>, Name: <%=p.getResourceSetName()%>, Scopes: {<%=p.getScopes()%>}</li>
        <% }
        %>
    </ul>


    <h2>Other Claims [<%=token.getOtherClaims().size()%>]</h2>
    <ul>
        <%
            for (String key : token.getOtherClaims().keySet()) {
                Object claim = token.getOtherClaims().get(key);
        %>
        <li>Key: <%=key%>, Name: <%=claim%>
        </li>
        <% }
        %>
    </ul>


    <h2>Resource Access [<%=token.getResourceAccess().size()%>]</h2>
    <ul>
        <%
            for (String key : token.getResourceAccess().keySet()) {
                AccessToken.Access access = token.getResourceAccess().get(key);

        %>
        <li>
            <h3>Roles [<%=key%>][<%=access.getRoles().size()%>]</h3>
            <ul>
                <%
                    Iterator<String> itr = access.getRoles().iterator();
                    while (itr.hasNext()) {

                %>
                <li>Role: <%=itr.next()%>
                </li>
                <% }
                %>
            </ul>
        </li>
        <% }
        %>
    </ul>


        <%
    }
%>

</body>
</html>
