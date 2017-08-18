#!/bin/sh


## STATIC INFORMATION
POSTGRESQL_SHA512="2827c88819eba38723d01bb34ee389e56c0002abe53ba51d13bacb327d3842e1b9ae79b7740c0b625e1daca9202e6adc7be28629ff3e877fd98c7a6949a63c0d"
POSTGRESQL_VERSION="9.4.1209"

DOWNLOAD_DIR="/tmp/download"

KEYCLOAK_HOME=${KEYCLOAK_HOME:-"/opt/jboss/keycloak"}


JBOSS_USER=${JBOSS_USER:-admin}
JBOSS_PASSOWRD=${JBOSS_PASSOWRD:-Abc!12345}

wildfly_configure(){
    ${KEYCLOAK_HOME}/bin/jboss-cli.sh --file=/opt/jboss/.docker/keycloak-setup.cli
}


wildfly_add_user(){
    ${KEYCLOAK_HOME}/bin/add-user.sh ${JBOSS_USER} ${JBOSS_PASSOWRD} --silent
}


dir_download_init(){
    if [ ! -e "${DOWNLOAD_DIR}" ]; then
        mkdir -p ${DOWNLOAD_DIR}
    fi

    if [ ! -e "${DOWNLOAD_DIR}" ]; then
        echo "ERROR: Failed to create download directory"
        exit 1
    fi
}


wildfly_module_postgres(){
    dir_download_init

    POSTGRESQL_JDBC_FILE="${DOWNLOAD_DIR}/postgresql-${POSTGRESQL_VERSION}.jar"
    if [ ! -e ${POSTGRESQL_JDBC_FILE} ]; then
        curl -o ${POSTGRESQL_JDBC_FILE} https://jdbc.postgresql.org/download/postgresql-${POSTGRESQL_VERSION}.jar

        if [ ! -e ${POSTGRESQL_JDBC_FILE} ]; then
            echo "ERROR: Failed to download file"
            return 1
        fi

        if [ -z $( sha512sum ${POSTGRESQL_JDBC_FILE} | grep ${POSTGRESQL_SHA512} ) ]; then
            echo "POSTGRES JDBC Failed Verification..."
            return 2
        fi


    fi
    echo "Instaling module...."
    KEYCLOAK_CLI="embed-server --server-config=standalone.xml\n\
module add --name=org.postgresql --resources=${POSTGRESQL_JDBC_FILE} --dependencies=javax.api,javax.transaction.api\n"
echo -e "${KEYCLOAK_CLI}" |  ${KEYCLOAK_HOME}/bin/jboss-cli.sh


}



## Get Postgresl jdbc module
wildfly_module_postgres

## Configure Wildfly
wildfly_configure

## Wildfly admin Users
wildfly_add_user


## Clean up
rm -rf ${DOWNLOAD_DIR}
