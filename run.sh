#!/usr/bin/env bash
set -e

usage_exit() {
  echo "Usage: $0 [-r (rebuild)] " 1>&2
  exit 1
}

REBUILD_FLAG=0
while getopts hr OPT
do
  case $OPT in
    r | rebuild ) REBUILD_FLAG=1;;
    h | help ) usage_exit;;
    \?) usage_exit;;
  esac
done

# rebuildフラグが立っている or x86_64-unknown-linux-gnu向けにビルドされたバイナリがなければbuildする
TARGET="./target/x86_64-unknown-linux-gnu/debug/try-rust-graphql"
if [ ${REBUILD_FLAG} = 1 ] || [ ! -f ${TARGET} ];then
  echo "=== Build try-rust-graphql ==="
  cross build --target=x86_64-unknown-linux-gnu
fi

# docker-composeでサーバとDBを立ち上げる
echo "=== Run try-rust-graphql with DB ==="
docker-compose -f ./docker-compose.yml up
