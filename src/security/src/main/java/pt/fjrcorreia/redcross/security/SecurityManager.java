/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 */
package pt.fjrcorreia.redcross.security;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public class SecurityManager {
    
    private Authenticator authenticator;
    
    
    private SecurityManager(){
        
    }
    
    
    private static SecurityManager instance = null;
    public static final SecurityManager getSecurityManager(){
        if (instance == null){
            instance = new SecurityManager();
        }
        
        return instance;
    }
    
    
    
    
    public Authenticator getAuthenticator(){
        return authenticator;
    }
}
