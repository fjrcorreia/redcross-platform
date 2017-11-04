-- Keycloak table creation
-- Keycloak database Creation
-- Create database for keycloak
CREATE DATABASE keycloak;

-- Create access role
CREATE ROLE keycloak PASSWORD 'keycloak' NOSUPERUSER LOGIN;

-- Grant all permissions to user keycloak
GRANT ALL ON  DATABASE keycloak TO keycloak;
