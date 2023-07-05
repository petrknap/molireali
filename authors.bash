#!/usr/bin/env bash

function authors {
  echo "# This is the official list of authors for copyright purposes." > "AUTHORS"
  echo "" >> "AUTHORS"
  git log --format='%aN <%aE>' | LC_ALL=C.UTF-8 sort -uf >> "AUTHORS"
}
