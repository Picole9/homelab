docker compose exec -u git gitea bash -c '/usr/local/bin/gitea dump -c data/gitea/conf/app.ini -f /tmp/gitea.zip'
docker compose cp gitea:/tmp/gitea.zip tmp/
