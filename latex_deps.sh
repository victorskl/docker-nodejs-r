#!/usr/bin/env bash

# Add preferred mirror site
#tlmgr option repository http://mirror.aarnet.edu.au/pub/CTAN/systems/texlive/tlnet/
tlmgr option repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet

while IFS='' read -r line || [[ -n "$line" ]]; do
    #echo "tlmgr install $line"
    tlmgr install $line
done < "$1"