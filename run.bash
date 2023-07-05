#!/usr/bin/env bash
set -e

DIR="$(realpath ${BASH_SOURCE%/*})"
RUN_FILE=".$(basename ${DIR})"
README_MD_FILE="README.md"

# Include plugins
. ${DIR}/reset_readme.bash

# Run scripts
for RUN_FILE_PATH in ${DIR}/../*/${RUN_FILE}; do (
  cd $(dirname ${RUN_FILE_PATH})
  reset_readme
  . ${RUN_FILE}
); done
