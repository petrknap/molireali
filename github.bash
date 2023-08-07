#!/usr/bin/env bash

function github-workflow {
  WORKFLOW="${1}"
  WORKFLOW_DIRECTORY=".github/workflows"

  mkdir --parent "${WORKFLOW_DIRECTORY}" || true
  cat "${DIR}/${WORKFLOW_DIRECTORY#?}/${WORKFLOW}.yaml" > "${WORKFLOW_DIRECTORY}/${WORKFLOW}.yaml"
}
