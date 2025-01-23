# homelab
docker-compose-files for my homelab

## overview
* docker-compose.yml: include all services
* per-service-files:
    * {service}.yml: docker-compose for service
    * ./env/{service}: env-files
    * ./volumes/{service}: volumes

## getting started
* installation:
    * [docker](https://docs.docker.com/manuals/) from [ansible-repo](https://github.com/Picole9/ansible): `ansible-playbook server.yaml -l server --ask-become-pass`
* configuration:
    * global-environment-variables: `cp .env-tmpl .env`
    * service-environment-variables: `cp env-tmpl/ env/`
* first startup: `docker compose up -d --remove-orphans`
* configuration domains for dns-challenge:
    * browser with ${LOCALIP}
    * configure dns-record with ${DOMAIN} and ${LOCALIP}
    * CNAME record in pihole for every service pointing to ${DOMAIN} (e.g. traefik.${DOMAIN} to ${DOMAIN})
* restart (`docker compose down` and `docker compose up -d`)

## backup
* run `backup/backup.sh .`
    * parameter: path to git-root
    * backup every service (looking for docker-compose-files like `{service}.yml`)
    * generic: volumes-folder `volumes/{service}` and env-file `env/{service}.env` of that service
    * if `backup/{service}.sh` exists, than uses that script instead

## services

### baikal
* [documentation](https://sabre.io/baikal/)
* CalDAV + CardDAV server

### bitwarden
* [documentation](https://github.com/dani-garcia/vaultwarden/wiki)
* password-manager, unofficial Bitwarden server implementation

### traefik
* [documentation](https://doc.traefik.io/traefik/)
* manages traffic for every service
* entrypoints:
    * 80 gets redirected to 443
    * 443 main access port
    * 222 ssh (git)
* lets-encrypt-certificates via dns-challenge (lego)

### pihole
* [documentation](https://pi-hole.net/)
* as dns-server
    * blocking unwanted domains
    * local dns

### gitea
* [documentation](https://docs.gitea.com/)
* git-server
* ssh-connection via port 222
    * example clone: `git clone ssh://git@gitea.${DOMAIN}:222/repo`

### home-assistant
* [documentation](https://www.home-assistant.io/)
* smart home automation

### owncloud infinite scale (oCIS)
* [documentation](https://owncloud.dev/ocis/)
* file-sync and share platform
* backup with rclone, example config in `env-tmpl/rclone.conf`, set domain, user and password (with `rclone obscure`) accordingly
* typical errors:
    * permission denied
        * `sudo chown -R 1000:1001 volumes/owncloud/`

### mealie
* [documentation](https://mealie.io/)
* recipe manager

### watchtower
* [documentation](https://containrrr.dev/watchtower/)
* automatic docker container image updates every day at 4am

### template new service
* add whoami to docker-compose.yml
* whoami.yml:
```yaml
services:
  whoami:
    image: traefik/whoami
    container_name: whoami
    restart: unless-stopped
    environment:
      - TZ=Europe/Berlin
    # env_file:
    #   - ./env/whoami.env
    # volumes:
    #   - ./volumes/whoami:/config
    networks:
      traefik:
    labels:
      - traefik.enable=true
      - traefik.http.routers.whoami.rule=Host(`whoami.${DOMAIN}`)
      - traefik.http.services.whoami.loadbalancer.server.port=80
```
* edit traefik-labels: router-name, service-name, subdomain

## helpful ressources
* [awesome-selfhosted](https://github.com/awesome-selfhosted/awesome-selfhosted)
* [IOTStack](https://sensorsiot.github.io/IOTstack/)
