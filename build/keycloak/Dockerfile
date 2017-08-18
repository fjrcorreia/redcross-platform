#
#
#
FROM jboss/keycloak:3.2.0.Final
MAINTAINER  Francisco Correia <fcorreia.skywalker@gmail.com>


ADD keycloak-setup.sh   /opt/jboss/.docker/keycloak-setup.sh
ADD keycloak-setup.cli   /opt/jboss/.docker/keycloak-setup.cli


RUN /opt/jboss/.docker/keycloak-setup.sh
