# homelab
docker-compose-files for my homelab

## overview
* docker-compose.yaml: traefik
* service-files:
    * {service}.yaml: docker-compose
    * ./env/{service}: env\_files
    * ./volumes/{service}: volumes

## installation
* docker from ansible-repo: `ansible-playbook server.yaml -l server --ask-become-pass`
* environment-variables: `cp env-tmpl/ env/`

## commands
* start-all: `docker compose $(find . -name "*.yml" -printf "-f %p ") up -d`
