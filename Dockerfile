FROM quay.io/keycloak/keycloak:latest AS builder

# Configure a database vendor
ENV KC_DB=postgres

WORKDIR /opt/keycloak
COPY keycloak.conf /opt/keycloak/conf/

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
