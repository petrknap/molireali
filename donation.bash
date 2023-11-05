#!/usr/bin/env bash

function donation {
  cat "${DIR}/donation/README.md" >> "${README_MD_FILE}"
  mkdir --parents ".github" || true
  cat "${DIR}/donation/.github/FUNDING.yaml" > ".github/FUNDING.yaml"
}
