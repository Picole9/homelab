docker compose exec -u git gitea /usr/local/bin/gitea dump -c data/gitea/conf/app.ini -f - >"volumes/$2/gitea.zip"
