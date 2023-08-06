#!/usr/bin/env bash
set -e

DIR="$(realpath ${BASH_SOURCE%/*})"
RUN_FILE=".$(basename ${DIR})"
README_MD_FILE="README.md"

# Include plugins
. ${DIR}/authors.bash
. ${DIR}/donation.bash
. ${DIR}/git.bash
. ${DIR}/license.bash
. ${DIR}/reset_readme.bash

# Run script
if [[ -e "${RUN_FILE}" ]]; then (
  reset_readme
  . ${RUN_FILE}
); fi
