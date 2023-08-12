#!/usr/bin/env bash

function reset_readme {
  function remove_tail() {
    README_MD_CONTENT="$(cat "${README_MD_FILE}")"
    README_MD_CONTENT="${README_MD_CONTENT%---*}"
    echo "${README_MD_CONTENT}" > "${README_MD_FILE}"
  }

  remove_tail # ---
  remove_tail # \n

  {
    echo ""
    echo "---"
    echo ""
  } >> "${README_MD_FILE}"
}
