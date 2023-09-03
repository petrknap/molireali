#!/usr/bin/env bash
set -e

DIR="$(realpath "${BASH_SOURCE%/*}")"
RUN_FILE=".molireali"
README_MD_FILE="README.md"

# Include plugins
. "${DIR}"/authors.bash
. "${DIR}"/composer.bash
. "${DIR}"/docker.bash
. "${DIR}"/donation.bash
. "${DIR}"/git.bash
. "${DIR}"/github.bash
. "${DIR}"/license.bash
. "${DIR}"/reset_readme.bash

# Run scripts
for RUN_FILE_PATH in "${DIR}"/../*/"${RUN_FILE}"; do (
  echo "Processing \"$(realpath "${RUN_FILE_PATH}")\""
  cd "$(dirname "${RUN_FILE_PATH}")"
  reset_readme
   # shellcheck disable=SC1090
  . "${RUN_FILE}"
); done
