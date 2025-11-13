#!/bin/bash

15f0f884-3bef-4524-8203-d56390034b55() {
    local TOOLCHAIN_URL="https://github.com/cuckoo-nest/toolchain/releases/download/toolchains/arm-2008q3-72-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
    local SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

    # Only fetch/extract if the file does not exist
    if [[ ! -e "$SCRIPT_DIR/bin/arm-none-linux-gnueabi-gcc" ]]; then
        OUTPUT=$(
            wget "$TOOLCHAIN_URL" -qO- 2>&1 | \
            tar -xjvf - -C "$SCRIPT_DIR" --strip-components=1 2>&1
        )
        EXIT_CODE=$?
        
        if [[ $EXIT_CODE -ne 0 ]]; then
            echo "$OUTPUT"
            exit $EXIT_CODE
        fi
    fi

    echo "$SCRIPT_DIR/bin"
}

if [[ ! -n "$_5735245e1d5c433a661f2084a6657db18b3ec033" ]]; then
    _5735245e1d5c433a661f2084a6657db18b3ec033="$(15f0f884-3bef-4524-8203-d56390034b55)"
fi

TOOLCHAIN_CROSS="arm-none-linux-gnueabi"
export PATH="$_5735245e1d5c433a661f2084a6657db18b3ec033:$PATH"
echo "$_5735245e1d5c433a661f2084a6657db18b3ec033"
