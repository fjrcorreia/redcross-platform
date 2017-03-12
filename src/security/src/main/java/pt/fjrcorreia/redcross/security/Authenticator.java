/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 */
package pt.fjrcorreia.redcross.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public interface Authenticator {
    
    
    
    
    public PlatformUser getUser(HttpServletRequest request);
    
    
    
    public PlatformUser login(HttpServletRequest request, HttpServletResponse response);
    
    
    
    public PlatformUser logout(HttpServletRequest request, HttpServletResponse response);
    
}
