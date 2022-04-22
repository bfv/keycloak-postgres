# Keycloak on Postgres

## first use
The first initialization of Postgres needs to be completely finished before keycloak can run. 
In order to do so, first run `docker compose up postgres -d`, let it run for a minute and then start keycloak with `docker compose up keycloak -d`. On subsequent runs the enitire stack can be run at once.

