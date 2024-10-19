#!/usr/bin/env bash

function github-templates {
  GITHUB_DIRECTORY=".github"

  mkdir --parent "${GITHUB_DIRECTORY}" || true
  for TEMPLATE in "${DIR}/${GITHUB_DIRECTORY#?}/"*.md; do (
    cat "${TEMPLATE}" > "${GITHUB_DIRECTORY}/$(basename "${TEMPLATE}")"
  ); done
}

function github-workflow {
  WORKFLOW="${1}"
  ARG1="${2}"
  ARG2="${3}"
  ARG3="${4}"
  WORKFLOW_DIRECTORY=".github/workflows"

  mkdir --parent "${WORKFLOW_DIRECTORY}" || true
  WORKFLOW_CONTENT="$(cat "${DIR}/${WORKFLOW_DIRECTORY#?}/${WORKFLOW}.yaml")"
  # shellcheck disable=SC2001
  WORKFLOW_CONTENT="$(echo "${WORKFLOW_CONTENT}" | sed "s/\$1/${ARG1}/g" | sed "s/\$2/${ARG2}/g" | sed "s/\$3/${ARG3}/g")"
  echo "${WORKFLOW_CONTENT}" > "${WORKFLOW_DIRECTORY}/${WORKFLOW}.yaml"

  git-export-ignore .github
}
