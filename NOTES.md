



Google Broker is enabled on google developer console
 * Google Guide: https://developers.google.com/identity/sign-in/web/devconsole-project
 * [Google API Console](https://console.developers.google.com/project/_/apiui/apis/library)
 * Keycloack Google Identity Broker Requires Google+ to be Enabled (Google APi console: https://console.developers.google.com/apis/library?project=maiorca-cvp)


Facebook Broker
 *  https://developers.facebook.com (Requires a Facebook account)
 * After activating the developer account, add an application and the facebook login

https://developers.facebook.com/docs/apps/register
https://developers.facebook.com/docs/apps


Documentation
Travis Sonar
https://docs.travis-ci.com/user/sonarqube/
https://aroundthecode.org/2016/06/18/travisci-sonarqube-anaysis/
https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner




## https://access.redhat.com/documentation/en-us/red_hat_single_sign-on/7.0/html/server_administration_guide/export_import
bin/standalone.sh -Dkeycloak.migration.action=export \
-Dkeycloak.migration.provider=singleFile \
-Dkeycloak.migration.file=/tmp/keycloak-redcross.json \
-Dkeycloak.migration.realmName=redcross

-Dkeycloak.migration.action=export -Dkeycloak.migration.provider=singleF -Dkeycloak.migration.file=<FILE TO EXPORT TO>
-Dkeycloak.migration.action=export -Dkeycloak.migration.provider=dir -Dkeycloak.migration.dir=/tmp/keycloack -Dkeycloak.migration.realmName=red-cross
-Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/tmp/keycloack/red-cross.json -Dkeycloak.migration.strategy=IGNORE_EXISTING
