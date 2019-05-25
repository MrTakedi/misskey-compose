#!/bin/sh
set -xe

if [ -z "$@" ];then
  echo "error format. useage: 'npm restart core'"
  exit 1
fi

for i in $@;
do
  docker service update --force ${npm_package_name}_${i}
done
