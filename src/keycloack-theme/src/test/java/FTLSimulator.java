/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.io.Writer;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import java.io.IOException;
import java.util.Locale;
import model.TestConfig;
import model.TestProperties;
import model.TestRealm;

/**
 *
 * @author Francisco Correia {@literal <https://github.com/fjrcorreia>}
 */
public class FTLSimulator {

    public static void main(String[] args) throws IOException, TemplateException {

       doLogin();

    }

    
    private static void doLogin() throws IOException, TemplateException{
         // Configuration
        TestRealm testRealm = new TestRealm();
        testRealm.setRegistrationAllowed(false);
        Locale locale = new Locale("pt");
        TestConfig themeCfg = new TestConfig("target/classes", "redcross", "login");
        themeCfg.setResourcesPath("../../../classes/theme/redcross/login/resources");
        themeCfg.setRealm(testRealm);
        themeCfg.setLocale(locale);

        outputTemplate("login", themeCfg);
        outputTemplate("terms", themeCfg);
        //outputTemplate("register", themeCfg);
        outputTemplate("login-verify-email", themeCfg);
        //outputTemplate("login-update-profile", themeCfg);
        outputTemplate("login-update-password", themeCfg);
        outputTemplate("login-totp", themeCfg);
        outputTemplate("login-reset-password", themeCfg);
        outputTemplate("login-oauth-grant", themeCfg);
        //outputTemplate("login-idp-link-email", themeCfg);
        outputTemplate("login-idp-link-confirm", themeCfg);
        outputTemplate("login-config-totp", themeCfg);
        outputTemplate("info", themeCfg);
        outputTemplate("error", themeCfg);
        outputTemplate("code", themeCfg);
        outputTemplate("bypass_kerberos", themeCfg);
    }
    
    
    
    private static void outputTemplate(String templateName, TestConfig themeConfig) throws IOException, TemplateException {
        Configuration cfg = themeConfig.getFreeMarkerConfig();

        String outBaseDir = "target/html/" + themeConfig.getThemeName() + "/" + themeConfig.getThemeType();
        File f = new File(outBaseDir);
        if (!f.exists()){
            f.mkdirs();
        }
        
        String outputFile = outBaseDir + "/" + templateName + ".html";
        
        TestProperties themeProperties = themeConfig.getThemeProperties();

        // Load Template
        Template template = cfg.getTemplate(templateName + ".ftl");

        // Process and Output
//        Writer consoleWriter = new OutputStreamWriter(System.out);
//        template.process(themeProperties, consoleWriter);
        Writer fileWriter = new FileWriter(new File(outputFile));
        try {
            template.process(themeProperties, fileWriter);
            System.out.println(" - [" + templateName + "]:-> " + outputFile);
        } finally {
            fileWriter.close();
        }

    }

}
