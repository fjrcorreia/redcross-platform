/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 */
package pt.fjrcorreia.redcross.security.keycloak;

import org.keycloak.KeycloakPrincipal;
import org.keycloak.representations.IDToken;
import pt.fjrcorreia.redcross.security.PlatformUser;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public class KeycloakUser implements PlatformUser {

    private final KeycloakPrincipal keycloakPrincipal;
    
    private final IDToken idToken;
    
    private final String username;
    private final String displayName;
    
    private final String email;
    
    public KeycloakUser(KeycloakPrincipal principal){
        keycloakPrincipal = principal;
        idToken = principal.getKeycloakSecurityContext().getIdToken();
        username = idToken.getPreferredUsername();
        String value = keycloakPrincipal.getKeycloakSecurityContext().getIdToken().getNickName();
        displayName = (value != null ? value : username);
        email = keycloakPrincipal.getKeycloakSecurityContext().getIdToken().getEmail();
    }

    @Override
    public String getName() {
        return username;
    }

    
    @Override
    public String getDisplayName() {
        return displayName;
    }

    @Override
    public String getEmail() {
        return email;
    }


    
    
}
