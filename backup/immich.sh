#!/bin/bash
sudo tar -czf "$1/$2.tar.gz" "volumes/$2/library/backups"
echo "- rclone"
mkdir "$1/$2/"
rclone copy --config=env/rclone.conf "volumes/$2/library/library" "$1/$2/"
