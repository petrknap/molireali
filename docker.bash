#!/usr/bin/env bash

function dockerfile {
  IMAGE="${1}"
  TAG="${2}"

  python3 "${DIR}/docker/update.py" \
    --file "$(pwd)/Dockerfile" \
    --image "${IMAGE}:${TAG}" \
    --includes "${DIR}/docker/${IMAGE}" \
  ;
}
