
ARG KEYCLOAK_VERSION=latest

FROM keycloak/keycloak:$KEYCLOAK_VERSION AS builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres

RUN /opt/keycloak/bin/kc.sh build

FROM keycloak/keycloak:$KEYCLOAK_VERSION

ARG BUILD_DATE
ARG KEYCLOAK_VERSION

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date="${BUILD_DATE}"
LABEL org.label-schema.name="keycloak-postgres"
LABEL org.label-schema.description="A purposely built image on top of quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}, set up for Postgres db"
LABEL org.label-schema.vcs-url="https://github.com/bfv/keycloak-postgres"
LABEL org.label-schema.vendor="bfv.io"

LABEL maintainer="dev@bfv.io"

COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
