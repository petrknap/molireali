#!/usr/bin/env bash

function composer {
  NAMESPACE="${1}"
  TYPE="${2}"
  PHP="$(awk -F ' ' '/linter-php/ {print $3}' .molireali)"
  LICENSE="$(awk -F ' ' '/license/ {print $2}' .molireali)"
  DESCRIPTION="$(head -n 1 "${README_MD_FILE}" | cut -c 3-10000)"

  COMPOSER_NAME="$(python3 "${DIR}/composer/update.py" \
    --file "$(pwd)/composer.json" \
    --type "${TYPE}" \
    --namespace "${NAMESPACE}" \
    --php "${PHP}" \
    --license "${LICENSE}" \
    --description "${DESCRIPTION}" \
  )"

  echo "Run \`composer require ${COMPOSER_NAME}\` to install it." >> "${README_MD_FILE}"

  if [[ "${TYPE}" == '' || "${TYPE}" == 'library' ]]; then (
    # shellcheck disable=SC1091
    . "${DIR}/composer/bin/run.bash" composer require "${COMPOSER_NAME}" "*" || true
  ); fi

  git-export-ignore tests
}
