#!/bin/bash

i=1

# Utiliser find avec -print0 et trier proprement
find . -maxdepth 1 -type f -name "Pasted image *.png" -print0 | \
    sort -z -t' ' -k3 | \
    while IFS= read -r -d '' file; do
        new_name=$(printf "PWN_Industrial_%02d.png" "$i")
        mv "$file" "$new_name"
        echo "Renamed '$file' -> '$new_name'"
        ((i++))
    done

