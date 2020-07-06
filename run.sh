#!/bin/bash
docker-compose down
./scripts/image_build.sh ambe release-v2
docker-compose up -d
sleep 5
systemctl restart nginx
sleep 5
echo "All is well !!!"
