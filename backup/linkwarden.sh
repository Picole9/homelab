#!/bin/bash
if [ "$3" = "backup" ]; then
    echo "- backup db"
    docker compose exec -u linkwarden-db pg_dumpall -U postgres -c >"$1/$2.dump"
    echo "- backup env"
    tar -czf - "env/$2.env" "volumes/$2/data" >/dev/null | gzip --rsyncable > "$1/$2.tar.gz
else
    echo "- only files in backup. Setup a new server and copy files"
fi
