#!/usr/bin/env bash

function license {
  LICENSE="${1}"

  for LICENSE_FILE in "${DIR}/license/${LICENSE}/"*; do (
    LICENSE_FILE_TARGET="$(basename "${LICENSE_FILE}")"
    if [[ "${LICENSE_FILE_TARGET}" == "${README_MD_FILE}" ]]; then
      echo "$(cat "${LICENSE_FILE}")" >> "${LICENSE_FILE_TARGET}"
    else
      echo "$(cat "${LICENSE_FILE}")" > "${LICENSE_FILE_TARGET}"
    fi
  ); done
}
