#! /usr/bin/env bash

set -eu -o pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils.sh"

: "${ASDF_NODEJS_NODEBUILD_HOME=$ASDF_NODEJS_PLUGIN_DIR/.node-build}"
: "${ASDF_NODEJS_CONCURRENCY=$((${ASDF_CONCURRENCY:-1} + 1 / 2))}"

# node-build environment variables being overriden by asdf-nodejs
export NODE_BUILD_CACHE_PATH="${NODE_BUILD_CACHE_PATH:-$ASDF_NODEJS_CACHE_DIR/node-build}"

if [ "$NODEJS_ORG_MIRROR" ]; then
  export NODE_BUILD_MIRROR_URL="$NODEJS_ORG_MIRROR"
fi

if [[ "${ASDF_NODEJS_CONCURRENCY-}" =~ ^[0-9]+$ ]]; then
  export MAKE_OPTS="${MAKE_OPTS:-} -j$ASDF_NODEJS_CONCURRENCY"
  export NODE_MAKE_OPTS="${NODE_MAKE_OPTS:-} -j$ASDF_NODEJS_CONCURRENCY"
fi

nodebuild="${ASDF_NODEJS_NODEBUILD:-$ASDF_NODEJS_NODEBUILD_HOME/bin/node-build}" 
args=()

if ! [ -x "$nodebuild" ]; then
  printf "Binary for node-build not found\n"

  if ! [ "${ASDF_NODEJS_NODEBUILD-}" ]; then
    printf "Are you sure it was installed? Try running \`asdf %s update-nodebuild\` to do a local update or install\n" "$(plugin_name)"
  fi

  exit 1
fi

if [ "${ASDF_NODEJS_VERBOSE_INSTALL-}" ]; then
  args+=(-v)
fi

exec "$nodebuild" ${args+"${args[@]}"} "$@"
