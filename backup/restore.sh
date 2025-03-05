#!/bin/bash
cd "$(dirname "$0")/.."
services=($(find -maxdepth 1 -type f -name "*.yml" ! -name "docker-compose.yml"))
for service_file in "${services[@]}"; do
    service=$(basename "$service_file" .yml)
    echo "restore $service"
    if [ -e "backup/$service.sh" ]; then
        # specific restore
        bash "backup/$service.sh" "${1:-backup/tmp}" "$service" "restore"
    else
        # generic restore
        tar xf "${1:-backup/tmp}/$service.tar.gz"
    fi
done
