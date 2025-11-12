#!/bin/bash

SCRIPT_DIR="$(realpath "$(dirname "$0")")"

# Only fetch/extract if the file does not exist
if [[ ! -e "$SCRIPT_DIR/bin/arm-linux-gnueabi-gcc" ]]; then
    OUTPUT=$(
        wget "$(cat "$SCRIPT_DIR/toolchain.txt")" -qO- 2>&1 | \
        tar -xJvf - -C "$SCRIPT_DIR" --strip-components=1 2>&1
    )
    EXIT_CODE=$?
    
    if [[ $EXIT_CODE -ne 0 ]]; then
        echo "$OUTPUT"
        exit $EXIT_CODE
    fi
fi

echo "$SCRIPT_DIR/bin"