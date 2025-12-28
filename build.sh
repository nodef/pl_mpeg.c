#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -d "pl_mpeg" ]; then return; fi
URL="https://github.com/phoboslab/pl_mpeg/raw/refs/heads/master/pl_mpeg.h"
FILE="pl_mpeg.h"

# Download the release
mkdir -p "pl_mpeg"
echo "Downloading $FILE from $URL ..."
curl -L "$URL" -o "pl_mpeg/$FILE"
echo ""
}


# Test the project
test() {
echo "Running 01-extract-frames.c ..."
clang -I. -o 01.exe examples/01-extract-frames.c
./01.exe examples/earth-480p.mpg && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
