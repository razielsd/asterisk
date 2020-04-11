#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ID=`docker ps | grep 'callcenter.asterisk.dev' | awk '{print $1}'`


FILES="${DIR}/../docker/asterisk/config/*"

for FILENAME in $FILES
do
    NAME="$(basename -- $FILENAME)"
    echo "Upload: $NAME"
    docker cp $FILENAME $ID:/etc/asterisk/${NAME}
done

