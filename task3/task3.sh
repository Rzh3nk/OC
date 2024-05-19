#!/bin/bash
res="result.txt"
razr=".txt"

if [ -z "$1" ]; then
    echo "Ошибка"
    exit 1
fi
searching="$1"
find . -name "*${razr}" -type f -print0 | xargs -0 grep -l "${searching}" >> "${res}"
