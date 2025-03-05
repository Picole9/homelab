#!/bin/bash
cd "$(dirname "$0")/.."
services=($(find -maxdepth 1 -type f -name "*.yml" ! -name "docker-compose.yml"))
for service_file in "${services[@]}"; do
    service=$(basename "$service_file" .yml)
    echo "backup $service"
    if [ -e "backup/$service.sh" ]; then
        # specific backup
        bash "backup/$service.sh" "${1:-backup/tmp}" "$service" "backup"
    else
        # generic backup
        if [ -e "volumes/$service" ] && [ -e "env/$service.env" ]; then
            echo - backup volumes and env
            sudo tar -czf - "volumes/$service/" "env/$service.env" | gzip --rsyncable >"$1/$service.tar.gz"
        elif [ -e "volumes/$service" ]; then
            echo - backup volumes
            sudo tar -czf - "volumes/$service/" | gzip --rsyncable >"$1/$service.tar.gz"
        elif [ -e "env/$service.env" ]; then
            echo - backup env
            sudo tar -czf - "env/$service.env" | gzip --rsyncable >"$1/$service.tar.gz"
        else
            echo - nothing to backup
        fi
    fi
done
