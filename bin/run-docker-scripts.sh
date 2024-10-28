#!/bin/bash
set -eu

dir=$(dirname ${0})

${dir}/../ccd compose up -d

docker run --network=ccd-network -it --rm mintel/docker-wait-for-it -h rse-idam-simulator -p 5000 -t 360
${dir}/add-users.sh

docker run --network=ccd-network -it --rm mintel/docker-wait-for-it -h ccd-definition-store-api -p 4451 -t 360
${dir}/add-ccd-roles.sh

docker run --network=ccd-network -it --rm mintel/docker-wait-for-it -h am-role-assignment-service -p 4096 -t 360
${dir}/add-role-assignments.sh

# Optional to load definition file - assumes ccd-definition-store-api repo is cloned in same directory as ga-ccd-docker
# ${dir}/../../ccd-definition-store-api/gradlew clean smoke -p=${dir}/../../ccd-definition-store-api