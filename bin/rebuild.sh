#!/usr/bin/env bash

docker-compose down
docker-compose build
docker-compose up -d

ID=`docker ps | grep 'callcenter.asterisk.dev' | awk '{print $1}'`

echo "Run asterisk: /usr/sbin/asterisk -f"
echo "CMD: docker exec -it ${ID} bash"

docker exec -it ${ID} bash

