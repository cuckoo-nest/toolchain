#!/bin/bash

# TARGET
if [[ ! -n "$_b9583030100b23d94d6e3fe975872085de81e4cb" ]]; then
    _b9583030100b23d94d6e3fe975872085de81e4cb="arm-none-linux-gnueabi"
fi

15f0f884-3bef-4524-8203-d56390034b55() {
    local TOOLCHAIN_URL="https://github.com/cuckoo-nest/toolchain/releases/download/toolchains/arm-2008q3-72-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
    local SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
    local CACHE_DIR="$SCRIPT_DIR/.cache/$(echo -n "$TOOLCHAIN_URL" | sha1sum | cut -d ' ' -f 1)"

    # Only fetch/extract if the file does not exist
    if [[ ! -e "$CACHE_DIR/bin/${_b9583030100b23d94d6e3fe975872085de81e4cb}-gcc" ]]; then
        mkdir -p "$CACHE_DIR"
        OUTPUT=$(
            wget "$TOOLCHAIN_URL" -qO- 2>&1 | \
            tar -xjvf - -C "$CACHE_DIR" --strip-components=1 2>&1
        )
        EXIT_CODE=$?
        
        if [[ $EXIT_CODE -ne 0 ]]; then
            echo "$OUTPUT"
            exit $EXIT_CODE
        fi
    fi

    echo "$CACHE_DIR/bin"
}

# PATH
if [[ ! -n "$_5735245e1d5c433a661f2084a6657db18b3ec033" ]]; then
    _5735245e1d5c433a661f2084a6657db18b3ec033="$(15f0f884-3bef-4524-8203-d56390034b55)"
fi

TOOLCHAIN_CROSS="$_b9583030100b23d94d6e3fe975872085de81e4cb"
TOOLCHAIN_PATH="$_5735245e1d5c433a661f2084a6657db18b3ec033"
export PATH="$_5735245e1d5c433a661f2084a6657db18b3ec033:$PATH"

echo "_b9583030100b23d94d6e3fe975872085de81e4cb=$_b9583030100b23d94d6e3fe975872085de81e4cb"
echo "_5735245e1d5c433a661f2084a6657db18b3ec033=$_5735245e1d5c433a661f2084a6657db18b3ec033"
echo "TOOLCHAIN_CROSS=$TOOLCHAIN_CROSS"
echo "TOOLCHAIN_PATH=$TOOLCHAIN_PATH"
