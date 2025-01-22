#!/bin/bash
echo "- rclone"
mkdir "backup/tmp/$1/"
rclone copy --config=backup/rclone.conf ocis: "backup/tmp/$1/"
