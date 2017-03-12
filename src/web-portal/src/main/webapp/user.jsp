<%-- 
    Document   : user.jsp
    Created on : Feb 27, 2017, 7:05:47 PM
    Author     : Francisco Correia {@literal <https://github.com/fjrcorreia>}
--%>

<%@page import="org.keycloak.representations.IDToken"%>
<%@page import="org.keycloak.KeycloakPrincipal"%>
<%@page import="java.security.Principal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <h1>User Info: <%=(principal != null ? principal.getClass().getCanonicalName() : "No User Found!")%></h1>

        <%
            if (user != null) {
                IDToken identityToken = user.getKeycloakSecurityContext().getIdToken();
        %>
        <ul>
            <li>User: <%=user.getName()%></li>
            <li>AccessTokenHash: <%=identityToken.getAccessTokenHash()%></li> 
            <li>getAcr: <%=identityToken.getAcr()%></li> 
            <li>getAddress: <%=identityToken.getAddress()%></li> 
            <li>getAudience: <%=identityToken.getAudience()%></li> 
            <li>getAuthTime: <%=identityToken.getAuthTime()%></li> 
            <li>getBirthdate: <%=identityToken.getBirthdate()%></li> 
            <li>getClaimsLocales: <%=identityToken.getClaimsLocales()%></li> 
            <li>getCodeHash: <%=identityToken.getCodeHash()%></li> 
            <li>getEmail: <%=identityToken.getEmail()%></li> 
            <li>getEmailVerified: <%=identityToken.getEmailVerified()%></li> 
            <li>getExpiration: <%=identityToken.getExpiration()%></li> 
            <li>getFamilyName: <%=identityToken.getFamilyName()%></li> 
            <li>getGender: <%=identityToken.getGender()%></li> 
            <li>getGivenName: <%=identityToken.getGivenName()%></li> 
            <li>getId: <%=identityToken.getId()%></li> 
            <li>getIssuedFor: <%=identityToken.getIssuedFor()%></li> 
            <li>getIssuer: <%=identityToken.getIssuer()%></li> 
            <li>getLocale: <%=identityToken.getLocale()%></li> 
            <li>getMiddleName: <%=identityToken.getMiddleName()%></li> 
            <li>getName: <%=identityToken.getName()%></li> 
            <li>getNonce: <%=identityToken.getNonce()%></li> 
            <li>getNickName: <%=identityToken.getNickName()%></li> 
            <li>getNotBefore: <%=identityToken.getNotBefore()%></li> 
            <li>getPhoneNumber: <%=identityToken.getPhoneNumber()%></li> 
            <li>getPhoneNumberVerified: <%=identityToken.getPhoneNumberVerified()%></li> 
            <li>getPreferredUsername: <%=identityToken.getPreferredUsername()%></li> 
            <li>getProfile: <%=identityToken.getProfile()%></li> 
            <li>getSessionState: <%=identityToken.getSessionState()%></li> 
            <li>getSubject: <%=identityToken.getSubject()%></li> 
            <li>getType: <%=identityToken.getType()%></li> 
            <li>getUpdatedAt: <%=identityToken.getUpdatedAt()%></li> 
            <li>getWebsite: <%=identityToken.getWebsite()%></li> 
            <li>getZoneinfo: <%=identityToken.getZoneinfo()%></li> 
            <li>getOtherClaims: <%=identityToken.getOtherClaims()%></li> 
        </ul>


        <%
            }
        %>

    </body>
</html>
