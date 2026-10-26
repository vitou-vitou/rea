#!/usr/bin/env bash
set -euo pipefail
script="$(cd "$(dirname "$0")" && pwd)/toggle.sh"
set +e
output=$(bash "$script" 2>&1)
status=$?
set -e
if [[ "$status" -ne 2 ]]; then
  printf 'expected exit 2, got %s\n' "$status" >&2
  printf '%s\n' "$output" >&2
  exit 1
fi
case "$output" in
  *"usage: toggle.sh on|off"*) ;;
  *)
    printf 'expected usage line\n' >&2
    printf '%s\n' "$output" >&2
    exit 1
    ;;
esac
printf 'ok\n'
