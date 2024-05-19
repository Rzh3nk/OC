#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка"
    exit 1
fi
searching="$1"
res="result.txt"
razr=".txt"
find . -name "*${razr}" -type f -print0 | xargs -0 grep -l "${searching}" >> "${res}"
