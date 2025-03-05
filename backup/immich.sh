#!/bin/bash
if [ "$3" = "backup" ]; then
    echo "- rclone"
    mkdir -p "$1/$2/"
    rclone sync --config=env/rclone.conf "volumes/$2/library/library" "$1/$2/"
else
    echo "- only files in backup. Setup a new server and copy files"
fi
