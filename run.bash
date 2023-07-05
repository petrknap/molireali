#!/usr/bin/env bash
set -e

DIR="$(realpath ${BASH_SOURCE%/*})"
RUN_FILE=".$(basename ${DIR})"

# Include modules

# Run scripts
for RUN_FILE_PATH in ${DIR}/../*/${RUN_FILE}; do (
  cd $(dirname ${RUN_FILE_PATH})
  . ${RUN_FILE}
); done
