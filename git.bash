#!/usr/bin/env bash

function git-crlf {
  PATTERN="${1}"

  touch .gitattributes
  sed -i "/^${PATTERN}/d" .gitattributes
  echo "${PATTERN} text eol=crlf" >> .gitattributes
}
