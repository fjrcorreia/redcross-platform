<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "form">
        <#if realm.password>
                <form id="kc-form-login" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                        </div>

                        <div class="${properties.kcInputWrapperClass!}">
                            <input id="username" class="${properties.kcInputClass!}" name="username" placeholder="user@server.dom" type="email" required autofocus autocomplete="off" />
                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div class="${properties.kcLabelWrapperClass!}">
                            <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                        </div>

                        <div class="${properties.kcInputWrapperClass!}">
                            <input id="password" class="${properties.kcInputClass!}" name="password" type="password" placeholder="enter password" required autocomplete="off" />
                        </div>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <div class="${properties.kcFormButtonsWrapperClass!}">
                                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                            </div>
                        </div>

                        <#if realm.rememberMe && !usernameEditDisabled??>
                        <div class="pull-left checkbox">
                            <label>
                                <#if login.rememberMe??>
                                <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
                                <#else>
                                <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
                                </#if>
                            </label>
                        </div>
                        </#if>
                        <div class="pull-right need-help">
                            <#if realm.resetPasswordAllowed>
                            <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>

                    </div>
                </form>
        </#if>
    <#elseif section = "info" >

       <#if realm.password && social.providers??>
        <div id="kc-social-providers" class="social-buttons">
            <#list social.providers as p>
            <a href="${p.loginUrl}" id="signin-${p.alias}"
            class="btn btn-lg btn-block btn-social btn-social btn-${p.providerId}"><span class="fa fa-${p.providerId}"></span>${p.displayName}</a>
            </#list>
        </div>
        </#if>
    </#if>
</@layout.registrationLayout>
