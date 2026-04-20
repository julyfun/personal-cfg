#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <ssh-host>"
  exit 1
fi

HOST="$1"
OS="linux"
ARCH="x86_64"   # ARM 改成 aarch64

if ! command -v zed >/dev/null 2>&1; then
  echo "ERROR: zed CLI not found in PATH"
  exit 1
fi

ZED_VERSION_LINE="$(zed --version)"
APP_PATH="$(printf '%s\n' "$ZED_VERSION_LINE" | grep -o '/.*\.app$' || true)"
if [[ -z "$APP_PATH" ]]; then
  echo "ERROR: failed to parse app path from: $ZED_VERSION_LINE"
  exit 1
fi

ZED_BIN="${APP_PATH}/Contents/MacOS/zed"
if [[ ! -x "$ZED_BIN" ]]; then
  echo "ERROR: zed app binary not executable: $ZED_BIN"
  exit 1
fi

FULL_VERSION="$("$ZED_BIN" --system-specs 2>/dev/null | sed -n 's/^Zed: v\([^ ]*\).*/\1/p' | head -n1)"
if [[ -z "$FULL_VERSION" ]]; then
  echo "ERROR: failed to get full version from: $ZED_BIN --system-specs"
  exit 1
fi

SHORT_VERSION="${FULL_VERSION%%+*}"

CHANNEL_FROM_VERSION=""
if [[ "$FULL_VERSION" == *"+"* ]]; then
  CHANNEL_FROM_VERSION="${FULL_VERSION#*+}"
  CHANNEL_FROM_VERSION="${CHANNEL_FROM_VERSION%%.*}"
fi

case "$CHANNEL_FROM_VERSION" in
  stable|preview|nightly|dev) CHANNEL="$CHANNEL_FROM_VERSION" ;;
  *)
    CHANNEL="preview"
    echo "WARN: failed to infer release channel from full version '$FULL_VERSION', fallback to '$CHANNEL'"
    ;;
esac

DOWNLOAD_VERSION="$SHORT_VERSION"

API="https://cloud.zed.dev/releases/${CHANNEL}/${DOWNLOAD_VERSION}/asset?asset=zed-remote-server&os=${OS}&arch=${ARCH}"

JSON="$(curl -fsSL "$API")"
URL="$(printf '%s' "$JSON" | jq -r '.url')"
TARGET_VERSION="$FULL_VERSION"

LOCAL_GZ="/tmp/zed-remote-server-${OS}-${ARCH}.gz"
REMOTE_DIR="~/.zed_server"
REMOTE_BIN="${REMOTE_DIR}/zed-remote-server-${CHANNEL}-${TARGET_VERSION}"
REMOTE_TMP="${REMOTE_BIN}-download-$$.gz"

curl -fL "$URL" -o "$LOCAL_GZ"
ssh "$HOST" "mkdir -p $REMOTE_DIR"
scp "$LOCAL_GZ" "$HOST:$REMOTE_TMP"
ssh "$HOST" "gunzip -f $REMOTE_TMP && chmod 755 ${REMOTE_TMP%.gz} && mv ${REMOTE_TMP%.gz} $REMOTE_BIN"
ssh "$HOST" "$REMOTE_BIN version"
