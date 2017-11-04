/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE', which is part of this source code package.
 */
package pt.fjrcorreia.redcross.security.auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pt.fjrcorreia.redcross.security.Authenticator;
import pt.fjrcorreia.redcross.security.PlatformUser;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public abstract class AbstractAuthenticator implements Authenticator {

    public static final String AUTH_PLATFORM_USER = "org.redcross.security.user";

    @Override
    public PlatformUser getUser(HttpServletRequest request) {
        HttpSession ss = request.getSession(false);
        PlatformUser user = (ss != null ? (PlatformUser) ss.getAttribute(AUTH_PLATFORM_USER) : null);
        return user;
    }

    protected void createAndEstablishSession(HttpServletRequest request, HttpServletResponse response, PlatformUser user) {
        if (user == null) {
            return;
        }

        HttpSession ss = request.getSession(true);
        ss.setAttribute(AUTH_PLATFORM_USER, user);

    }

    protected PlatformUser removeAndClearSession(HttpServletRequest request, HttpServletResponse response) {
        PlatformUser user = getUser(request);
        if (user != null) {
            HttpSession ss = request.getSession(true);
            ss.setAttribute(AUTH_PLATFORM_USER, null);
        }
        return user;
    }

}
