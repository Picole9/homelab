#!/bin/bash
if [ "$3" = "backup" ]; then
    echo "- backup git"
    docker compose exec -u git gitea /usr/local/bin/gitea dump -c data/gitea/conf/app.ini -f - >"$1/$2-dump.zip"
    echo "- backup env"
    tar -czf - "env/$2.env" | gzip --rsyncable >"$1/$2.tar.gz"
else
    tar xf "$1/$2.tar.gz"
fi
