#!/bin/bash
if [[ -z "$FONTCONFIG_FILE" ]]; then
    export FONTCONFIG_FILE=$CONDA_PREFIX/etc/fonts/fonts.conf
    export FONTCONFIG_PATH=$CONDA_PREFIX/etc/fonts/
fi