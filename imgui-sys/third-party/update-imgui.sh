#!/bin/bash
set -euo pipefail

VERSION="v1.88"
COMMITHASH=9aae45eb4a05a5a1f96be1ef37eb503a12ceb889

SCRIPT_DIR="$(dirname ${0} | python3 -c 'import os, sys; print(os.path.abspath(sys.stdin.read().strip()))' )"
CLONE_DIR="$(mktemp -d tmp.imgui.XXX)"

pushd "${CLONE_DIR}" > /dev/null
git clone https://github.com/ocornut/imgui imgui
popd > /dev/null

cd ${SCRIPT_DIR}
./_update-imgui.sh "$CLONE_DIR"/imgui "$VERSION" ./imgui-master/imgui
./_update-imgui.sh "$CLONE_DIR"/imgui "$COMMITHASH" ./imgui-docking/imgui
