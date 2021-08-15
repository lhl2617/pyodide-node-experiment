#!/usr/bin/env bash
set -e

# Ensure we're in the project root
cd "$(dirname "$0")" && cd ..

ARTIFACTS_PATH="artifacts"
PYODIDE_PATH="$ARTIFACTS_PATH/pyodide"
PYODIDE_VERSION=$(cat package.json | jq .dependencies.pyodide | grep -o '[0-9]\+.[0-9]\+.[0-9]\+')
PYODIDE_ARTIFACT_LINK="https://github.com/pyodide/pyodide/releases/download/$PYODIDE_VERSION/pyodide-build-$PYODIDE_VERSION.tar.bz2"
TMP_PATH="$ARTIFACTS_PATH/tmp.tar.bz2"

echo "Removing $PYODIDE_PATH if present"
rm -rf "$PYODIDE_PATH"
mkdir -p "$ARTIFACTS_PATH"

echo "Fetching Pyodide from $PYODIDE_ARTIFACT_LINK"
curl -L "$PYODIDE_ARTIFACT_LINK" > "$TMP_PATH"
echo "Extracting Pyodide to $ARTIFACTS_PATH"
tar xjf "$ARTIFACTS_PATH/tmp.tar.bz2" -C "$ARTIFACTS_PATH"

echo "Cleaning up"
rm -rf "$TMP_PATH"

echo "Pyodide artifacts installed successfully"
