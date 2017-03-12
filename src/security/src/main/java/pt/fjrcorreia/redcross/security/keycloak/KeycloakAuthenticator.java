/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 */
package pt.fjrcorreia.redcross.security.keycloak;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pt.fjrcorreia.redcross.security.PlatformUser;
import pt.fjrcorreia.redcross.security.auth.AbstractAuthenticator;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public class KeycloakAuthenticator extends AbstractAuthenticator{

    
    
    
    
    @Override
    public PlatformUser login(HttpServletRequest request, HttpServletResponse response) {
        PlatformUser user = getUser(request);
        if (user != null) {
            return  user;
        }
        
        
        
        return user;
    }

    @Override
    public PlatformUser logout(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    
}
