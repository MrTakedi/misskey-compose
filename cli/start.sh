#!/bin/sh
set -e

if [[ -z "$@" ]];then
  npm run datadir:init
  npm run update
  exit
fi

for i in $@;
do
  docker service scale ${npm_package_name}_${i}=1
done
