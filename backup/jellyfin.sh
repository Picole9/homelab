#!/bin/bash
if [ "$3" = "backup" ]; then
    echo "- backup config"
    tar -czf - "volumes/$2/config" | gzip --rsyncable >"$1/$2.tar.gz"
else
    echo "- restore config"
    tar xf "$1/$2.tar.gz"
fi
