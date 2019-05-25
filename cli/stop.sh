#!/bin/sh
set -xe

if [ -z "$@" ];then
  docker stack rm $npm_package_name
  exit
fi

for i in $@;
do
  docker service scale ${npm_package_name}_${i}=0
done
