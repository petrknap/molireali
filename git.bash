#!/usr/bin/env bash

function git-crlf {
  PATTERN="${1}"

  touch .gitattributes
  sed -i "/^${PATTERN} text/d" .gitattributes
  echo "${PATTERN} text eol=crlf" >> .gitattributes
}

function git-export-ignore {
  PATTERN="${1}"

  touch .gitattributes
  sed -i "/^${PATTERN} export-ignore/d" .gitattributes
  echo "${PATTERN} export-ignore" >> .gitattributes
}
