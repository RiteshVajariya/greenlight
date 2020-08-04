#!/bin/bash
docker-compose -f /opt/greenlight/dev/greenlight/docker-compose-greenlight.yml -p demo down
./scripts/image_build.sh ambe release-v2
docker-compose -f /opt/greenlight/dev/greenlight/docker-compose-greenlight.yml -p demo up -d
sleep 5
systemctl restart nginx
echo "All is well !!!"
