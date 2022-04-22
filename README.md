# Keycloak on Postgres

## the `.env` file
The `.env` file is used for both building the custom keycloak image as well as for running it all together with Docker compose.
Copy `.env-template` to `.env` and modify the values.

## Building the custom Keycloak image
In order for the JDBC drivers to initialized (among other things) you first need to build a custom image based on `quay.io/keycloak/keycloak`. This can be done by executing `./build.sh`. Windows users utilize WSL2 for this. 

## first use
The first initialization of Postgres needs to be completely finished before keycloak can run. 
In order to do so, first run `docker compose up postgres -d`, let it run for a minute and then start keycloak with `docker compose up keycloak -d`. On subsequent runs the enitire stack can be run at once.

## running Keycloak
`docker compose up -d`. C'est tous.

