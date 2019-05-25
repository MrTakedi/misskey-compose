#!/bin/sh
set -xe

if [ -z "$@" ];then
  npm run init
  npm run update
  exit
fi

for i in $@;
do
  docker service scale ${npm_package_name}_${i}=1
done
