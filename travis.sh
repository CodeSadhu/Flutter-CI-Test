#!/usr/bin/env bash

set -e -o pipefail

if  [[ -n "$(type -t flutter)" ]]; then
  : ${FLUTTER:=flutter}
fi
echo "== FLUTTER: $FLUTTER"

FLUTTER_VERS=`$FLUTTER --version | head -1`
echo "== FLUTTER_VERS: $FLUTTER_VERS"

set -x;
$FLUTTER pub get;
$FLUTTER analyze;
$FLUTTER format --dry-run --set-exit-if-changed .;
$FLUTTER test

echo "== END OF TESTS"
