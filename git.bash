#!/usr/bin/env bash

function git-crlf {
  PATTERN="${1}"

  touch .gitattributes
  sed -i "/^${PATTERN} text/d" .gitattributes
  echo "${PATTERN} text eol=crlf" >> .gitattributes
}

function git-export-ignore {
  IGNORED="${1}"

  touch .gitattributes
  sed -i "/^${IGNORED} export-ignore/d" .gitattributes
  echo "${IGNORED} export-ignore" >> .gitattributes
}
