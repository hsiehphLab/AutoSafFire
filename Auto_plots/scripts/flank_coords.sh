#!/bin/bash

INPUT="$1"
OUTPUT="$2"

> "$OUTPUT"

while IFS=$'\t' read -r col1 col2 col3 col4 col5; do
    if (( col2 >= 100000 )); then
        col2=$(( col2 - 100000 ))
    else
        col2=0
    fi

    col3=$(( col3 + 100000 ))

    echo -e "${col1}\t${col2}\t${col3}\t${col4}\t${col5}" >> "$OUTPUT"
done < "$INPUT"

