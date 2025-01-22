#!/bin/bash
echo "- pg_dump"
docker compose exec db_recipes pg_dumpall -Udjangouser >volumes/$1/dump.sql
bash backup/generic.sh "$1"
