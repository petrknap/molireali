#!/usr/bin/env bash

function authors {
  echo "# This is the official list of authors for copyright purposes." > "AUTHORS"
  echo "" >> "AUTHORS"
  git shortlog --summary --email --numbered --all --no-merges | cut -f2- >> "AUTHORS"
}
