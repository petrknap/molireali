#!/usr/bin/env bash
DIR="$(realpath "${BASH_SOURCE%/*}")"

docker build "${DIR}/.." -t "$IMAGE:latest"
