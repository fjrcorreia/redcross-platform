#!/bin/sh
POSTGRESQL_SHA="2827c88819eba38723d01bb34ee389e56c0002abe53ba51d13bacb327d3842e1b9ae79b7740c0b625e1daca9202e6adc7be28629ff3e877fd98c7a6949a63c0d"

DOWNLOAD_DIR="/tmp/download"



wildfly_configure(){
    pkill -9 java

    /opt/wildfly/bin/jboss-cli.sh --file=/tmp/keycloak-adapter-install.cli
    /opt/wildfly/bin/jboss-cli.sh --file=/tmp/redcross-init.cli
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

    POSTGRESQL_JDBC_FILE="${DOWNLOAD_DIR}/postgresql-jdbc.jar"
    if [ ! -e ${POSTGRESQL_JDBC_FILE} ]; then
        wget -O ${POSTGRESQL_JDBC_FILE} https://jdbc.postgresql.org/download/postgresql-9.4.1209.jar

        if [ ! -e ${POSTGRESQL_JDBC_FILE} ]; then
            echo "ERROR: Failed to download file"
        fi
        sha512sum ${POSTGRESQL_JDBC_FILE} | grep $POSTGRESQL_SHA
        if [ $? -ne 0 ]; then
            echo "POSTGRES JDBC Failed Verification..."
            exit 1
        fi
    fi
}







## Get Postgresl jdbc module
# wildfly_module_postgres





wildfly_configure
