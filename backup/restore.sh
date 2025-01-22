#!/bin/bash
cd "$(dirname "$0")/.."
services=($(find -maxdepth 1 -type f -name "*.yml" ! -name "docker-compose.yml"))
for service_file in "${services[@]}"; do
    service=$(basename "$service_file" .yml)
    echo "restore $service"
    tar xf "backup/tmp/$service.tar.gz"
done
