#!/usr/bin/env bash

function dockerfile {
  IMAGE="${1}"
  TAG="${2}"

  python3 "${DIR}/docker/update.py" \
    --file "$(pwd)/Dockerfile" \
    --image "${IMAGE}:${TAG}" \
    --includes "${DIR}/docker/${IMAGE}" \
  ;

  git-export-ignore Dockerfile
}

function docker-scripts {
  IMAGE="${1}"
  WORKDIR="$(grep WORKDIR Dockerfile | cut -d ' ' -f 2)"

  mkdir "bin" || true
  for TERMINAL_FILE in "${DIR}/docker/"{build,run}.{bash,bat}; do (
    TERMINAL_FILE_TARGET="bin/$(basename "${TERMINAL_FILE}")"
    TERMINAL_FILE_CONTENT="$(cat "${TERMINAL_FILE}")"
    TERMINAL_FILE_CONTENT="${TERMINAL_FILE_CONTENT/\$IMAGE/$IMAGE}"
    TERMINAL_FILE_CONTENT="${TERMINAL_FILE_CONTENT/\$WORKDIR/$WORKDIR}"
    echo "${TERMINAL_FILE_CONTENT}" > "${TERMINAL_FILE_TARGET}"
  ); done
  chmod +x "bin/"*.bash

  git-export-ignore bin
}
