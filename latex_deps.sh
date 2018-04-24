#!/usr/bin/env bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    #echo "tlmgr install $line"
    tlmgr install $line
done < "$1"