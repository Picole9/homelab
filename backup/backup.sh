#!/bin/bash
cd "$(dirname "$0")/.."
services=($(find -maxdepth 1 -type f -name "*.yml" ! -name "docker-compose.yml"))
for service_file in "${services[@]}"; do
    service=$(basename "$service_file" .yml)
    echo "backup $service"
    if [ -e "backup/$service.sh" ]; then
        bash "backup/$service.sh" "$service"
    else
        bash backup/generic.sh "$service"
    fi
done
