/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import freemarker.cache.FileTemplateLoader;
import freemarker.ext.beans.BeansWrapper;
import freemarker.ext.beans.MapModel;
import freemarker.template.Configuration;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.Version;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public class TestConfig {

    public static final String THEME_PROPERTIES_FILE = "theme.properties";

    private final String themeDir;
    private final String fullPath;
    private final String themeName;
    private final String themeType;

    private TestRealm themeRealm = new TestRealm();
    private String resourcesPath;
    private Configuration freeMarkerConfig = null;
    private Locale themeLocale = Locale.ENGLISH;

    public TestConfig(String baseDir, String themeName, String themeType) {
        resourcesPath = baseDir;
        this.themeDir = "theme/" + themeName + "/" + themeType;
        this.fullPath = baseDir + File.separator + themeDir;
        this.themeName = themeName;
        this.themeType = themeType;
    }

    public Configuration getFreeMarkerConfig() {
        if (freeMarkerConfig == null) {
            try {
                freeMarkerConfig = getFreeMarkerConfiguration();
            } catch (IOException ex) {
                System.out.println("Error reading freemarker configuiration: " + ex.getMessage());
            }
        }
        return freeMarkerConfig;
    }

    public String getThemeName() {
        return this.themeName;
    }

    public String getThemeType() {
        return this.themeType;
    }

    public void setResourcesPath(String path) {
        resourcesPath = path;
    }

    public void setRealm(TestRealm realm) {
        this.themeRealm = realm;
    }

    public void setLocale(Locale locale) {
        this.themeLocale = locale;
    }

    public TestProperties getThemeProperties() throws IOException {
        return loadTemplateProperties();
    }

    private Configuration getFreeMarkerConfiguration() throws IOException {

        File baseDirPath = new File(fullPath);

        if (!baseDirPath.exists()) {
            throw new RuntimeException("Base Dir not Found: " + fullPath);
        }

        Configuration cfg = new Configuration();

        // Some other recommended settings:
        cfg.setIncompatibleImprovements(new Version(2, 3, 20));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setLocale(Locale.ENGLISH);
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.DEBUG_HANDLER);
        cfg.setTemplateLoader(new FileTemplateLoader(baseDirPath));
        return cfg;
    }

    private TestProperties loadTemplateProperties() throws IOException {

        // Properties
        InputStream propertiesInput = ClassLoader.getSystemResourceAsStream(themeDir + File.separator + THEME_PROPERTIES_FILE);

        if (propertiesInput == null) {
            System.out.println("Could not find resource...");
        }

        Properties themeProperties = new Properties();

        themeProperties.load(propertiesInput);

        ResourceBundle messages = ResourceBundle.getBundle(themeDir + "/messages/messages", themeLocale);

        Map<String, String> msgMap = new HashMap<>();
        msgMap.put("email", "Endere&ccedil;o de email");
        msgMap.put("password", "Password");
        msgMap.put("rememberMe", "Manter-me ligado");
        msgMap.put("doForgotPassword", "Precisa de Ajuda?");
        msgMap.put("doLogIn", "Entrar");
        msgMap.put("noAccount", "Não tem conta");
        msgMap.put("doRegister", "Efectuar Registo");
        //msgMap.put("loginTitle", "loginTitle");
        //msgMap.put("loginTitleHtml", "loginTitleHtml");

        for (String key : messages.keySet()) {
            msgMap.put(key, messages.getString(key));
        }

        MapModel msg = new MapModel(msgMap, new BeansWrapper());

        Properties url = new Properties();
        url.setProperty("resourcesPath", resourcesPath);

        url.setProperty("loginAction", "loginAction");
        url.setProperty("loginUrl", "loginUrl");
        url.setProperty("loginResetCredentialsUrl", "loginResetCredentialsUrl");
        url.setProperty("registrationUrl", "registrationUrl");
        url.setProperty("registrationAction", "registrationAction");
        url.setProperty("loginEmailVerificationUrl", "loginEmailVerificationUrl");
        url.setProperty("oauthAction", "oauthAction");

        // 2. Proccess template(s)
        //
        // You will do this for several times in typical applications.
        // 2.1. Prepare the template input:
        
        TestProperties tstProps = initTemplateProperties(String.format("theme/%s-variables.txt", themeType));

        // update
        tstProps.update("properties", themeProperties);
        tstProps.update("realm", themeRealm);
        tstProps.update("login", getLogin());
        tstProps.update("social", getProviders());

        // Define
        tstProps.put("url", url);
        tstProps.put("locale", getLocales());

        tstProps.put("displayInfo", Boolean.TRUE);
        tstProps.put("displayMessage", Boolean.FALSE);
        tstProps.update("message", getMessage());

        tstProps.put("user", getUser());
        tstProps.put("msg", msg);
        tstProps.put("code", getCodeInfo());
        //MapModel msgPerField = new MapModel(getUser(), new BeansWrapper());
        //tstProps.put("messagesPerField", msgPerField);

        return tstProps;
    }

    private static Map<String, Object> getUser() {
        Map<String, Object> user = new HashMap<>();
        user.put("editUsernameAllowed", Boolean.TRUE);
        user.put("username", "username");
        user.put("email", "email");
        user.put("firstName", "firstName");
        user.put("lastName", "lastName");
        return user;
    }

    private static Map<String, Object> getLocales() {
        Map<String, Object> lm = new HashMap<>();

        Properties pt = new Properties();
        Properties en = new Properties();

        pt.setProperty("url", "?lang=pt");
        pt.setProperty("label", "pt");

        en.setProperty("url", "?lang=en");
        en.setProperty("label", "en");

        lm.put("current", "pt");
        List ll = new ArrayList(2);
        ll.add(en);
        ll.add(pt);
        lm.put("supported", ll);
        return lm;
    }

    private static Map<String, Object> getMessage() {
        Map<String, Object> mm = new HashMap<>();
        mm.put("type", "success");
        mm.put("summary", "oohh no!! error message");
        return mm;
    }

    private static Map<String, Object> getLogin() {
        Map<String, Object> map = new HashMap<>();
        map.put("username", "sample-user");
        map.put("rememberMe", Boolean.TRUE);
        return map;
    }

    private static Map<String, Object> getCodeInfo() {
        Map<String, Object> map = new HashMap<>();
        map.put("success", Boolean.TRUE);
        map.put("error", "code.error");
        map.put("code", "code.code");
        return map;
    }

    private static Map<String, Object> getProviders() {
        Map<String, Object> map = new HashMap<>();
        List<Properties> pl = new ArrayList<>();
        Properties google = new Properties();
        google.setProperty("loginUrl", "http://login.url?cenas=value");
        google.setProperty("alias", "google-alias");
        google.setProperty("providerId", "google");
        google.setProperty("displayName", "Login with Google");
        pl.add(google);
        Properties facebook = new Properties();
        facebook.setProperty("loginUrl", "http://login.url?cenas=value");
        facebook.setProperty("alias", "facebook-alias");
        facebook.setProperty("providerId", "facebook");
        facebook.setProperty("displayName", "Login with Facebook");
        pl.add(facebook);
        map.put("providers", pl);
        return map;
    }

    private static TestProperties initTemplateProperties(String resourceName) {
        TestProperties env = new TestProperties();
        InputStream input = ClassLoader.getSystemResourceAsStream(resourceName);
        if (input == null) {
            System.out.println("ERROR: Could not find resource [" + resourceName + "]");
            return env;
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(input));

        int counter = 0;
        try {
            while (reader.ready()) {
                ++counter;
                String line = reader.readLine();
                String[] parts = line.split("\\.");

                Object value = env.get(parts[0]);

                if (parts.length == 1) {
                    if (value == null) {
                        env.put(parts[0], parts[0]);
                    }
                } else if (parts.length == 2) {
                    Map<String, Object> mapValue = (Map<String, Object>) value;
                    if (mapValue == null) {
                        mapValue = new HashMap<String, Object>();
                    }
                    mapValue.put(parts[1], parts[1]);
                    env.put(parts[0], mapValue);
                } else {
                    System.out.println("Unexptected Entry [" + counter + "]: " + line);
                }

            }
        } catch (IOException ex) {
            System.out.println("Error Reading file: " + ex.getMessage());
        }

        return env;
    }

}
