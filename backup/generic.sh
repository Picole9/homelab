#!/bin/bash
if [ -e "volumes/$2" ] && [ -e "env/$2.env" ]; then
    echo - backup volumes and env
    sudo tar -czf "$1/$2.tar.gz" "volumes/$2/" "env/$2.env"
elif [ -e "volumes/$service" ]; then
    echo - backup volumes
    sudo tar -czf "$1/$2.tar.gz" "volumes/$2/"
elif [ -e "env/$2.env" ]; then
    echo - backup env
    sudo tar -czf "$1/$2.tar.gz" -C "env/$s2.env"
else
    echo - nothing to backup
fi
