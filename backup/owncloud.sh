#!/bin/bash
echo "- rclone"
mkdir "$1/$2/"
rclone copy --config=env/rclone.conf ocis: "$1/$2/"
