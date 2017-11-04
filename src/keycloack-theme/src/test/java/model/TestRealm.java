/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public class TestRealm extends HashMap<String, Object> {

    public static final String displayName = "displayName";
    public static final String displayNameHtml = "displayNameHtml";
    public static final String internationalizationEnabled = "internationalizationEnabled";

    public static final String registrationEmailAsUsername = "registrationEmailAsUsername";

    public static final String loginWithEmailAllowed = "loginWithEmailAllowed";

    public static final String rememberMe = "rememberMe";

    public static final String resetPasswordAllowed = "resetPasswordAllowed";
    public static final String password = "password";
    public static final String registrationAllowed = "registrationAllowed";

    public TestRealm() {
        super.put(displayName, "[Test] Display Name");
        super.put(displayNameHtml, "[Test] Display HTML Name");
        super.put(internationalizationEnabled, Boolean.TRUE);
        super.put(registrationEmailAsUsername, Boolean.TRUE);
        super.put(loginWithEmailAllowed, Boolean.TRUE);
        super.put(rememberMe, Boolean.TRUE);
        super.put(resetPasswordAllowed, Boolean.TRUE);
        super.put(password, Boolean.TRUE);
        super.put(registrationAllowed, Boolean.TRUE);

    }

    public TestRealm setDisplayName(String value) {
        super.put(displayName, value);
        return this;
    }

    public TestRealm setDisplayNameHtml(String value) {
        super.put(displayNameHtml, value);
        return this;
    }

    public TestRealm setInternationalizationEnabled(String value) {
        super.put(internationalizationEnabled, value);
        return this;
    }

    public TestRealm setRegistrationEmailAsUsername(String value) {
        super.put(registrationEmailAsUsername, value);
        return this;
    }

    public TestRealm setLoginWithEmailAllowed(String value) {
        super.put(loginWithEmailAllowed, value);
        return this;
    }

    public TestRealm setRememberMe(String value) {
        super.put(rememberMe, value);
        return this;
    }

    public TestRealm setResetPasswordAllowed(boolean value) {
        super.put(resetPasswordAllowed, value);
        return this;
    }

    public TestRealm setPassword(String value) {
        super.put(password, value);
        return this;
    }

    public TestRealm setRegistrationAllowed(boolean value) {
        super.put(registrationAllowed, value);
        return this;
    }

   
}
