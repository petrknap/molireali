#!/usr/bin/env bash

function license {
  LICENSE="${1}"
  YEAR="${2}"
  AUTHOR="${3}"

  for LICENSE_FILE in "${DIR}/license/${LICENSE}/"*; do (
    LICENSE_FILE_TARGET="$(basename "${LICENSE_FILE}")"
    LICENSE_FILE_CONTENT="$(cat "${LICENSE_FILE}")"
    LICENSE_FILE_CONTENT="${LICENSE_FILE_CONTENT/\$YEAR/$YEAR}"
    LICENSE_FILE_CONTENT="${LICENSE_FILE_CONTENT/\$AUTHOR/$AUTHOR}"
    if [[ "${LICENSE_FILE_TARGET}" == "${README_MD_FILE}" ]]; then
      echo "${LICENSE_FILE_CONTENT}" >> "${LICENSE_FILE_TARGET}"
    else
      echo "${LICENSE_FILE_CONTENT}" > "${LICENSE_FILE_TARGET}"
    fi
  ); done
}
