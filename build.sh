#!/usr/bin/env bash
URL="https://raw.githubusercontent.com/phoboslab/pl_mpeg/refs/heads/master/pl_mpeg.h"
FILE="pl_mpeg.h"

# Download the release
if [ ! -f "$FILE" ]; then
  echo "Downloading $FILE from $URL ..."
  curl -L "$URL" -o "$FILE"
  echo ""
fi
