#!/usr/bin/env bash

function github-workflow {
  WORKFLOW="${1}"
  WORKFLOW_ARG1="${2}"
  WORKFLOW_DIRECTORY=".github/workflows"

  mkdir --parent "${WORKFLOW_DIRECTORY}" || true
  WORKFLOW_CONTENT="$(cat "${DIR}/${WORKFLOW_DIRECTORY#?}/${WORKFLOW}.yaml")"
  WORKFLOW_CONTENT="$(echo "${WORKFLOW_CONTENT}" | sed "s/\$1/${WORKFLOW_ARG1}/g")"
  echo "${WORKFLOW_CONTENT}" > "${WORKFLOW_DIRECTORY}/${WORKFLOW}.yaml"
}
