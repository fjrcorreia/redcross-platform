/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 */
package pt.fjrcorreia.redcross.security;

import java.security.Principal;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public interface PlatformUser extends Principal {
    
    
    String getDisplayName();
    
    String getEmail();
    
    
    
}
