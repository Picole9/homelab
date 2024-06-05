# homelab
docker-compose-files for my homelab

## overview
* docker-compose.yml: include all services
* service-files:
    * {service}.yml: docker-compose for service
    * ./env/{service}: env\_files
    * ./volumes/{service}: volumes

## installation
* docker from ansible-repo: `ansible-playbook server.yaml -l server --ask-become-pass`
* global-environment-variables: `cp .env-tmpl .env`
* service-environment-variables: `cp env-tmpl/ env/`

## commands
* startup: `docker compose up -d --remove-orphans`
