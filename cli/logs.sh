#!/bin/sh
set -xe

if [ -z "$1" ];then
  echo "error format. useage: 'npm run logs -- init --since 0m'"
  exit 1
fi

docker service logs -f ${npm_package_name}_$@
