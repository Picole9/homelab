#!/bin/bash
service=$1
if [ -e "volumes/$service" ] && [ -e "env/$service.env" ]; then
    echo - backup volumes and env
    sudo tar -czf "backup/tmp/$service.tar.gz" "volumes/$service/" "env/$service.env"
elif [ -e "volumes/$service" ]; then
    echo - backup volumes
    sudo tar -czf "backup/tmp/$service.tar.gz" "volumes/$service/"
elif [ -e "env/$service.env" ]; then
    echo - backup env
    sudo tar -czf "backup/tmp/$service.tar.gz" -C "env/$service.env"
else
    echo - nothing to backup
fi
