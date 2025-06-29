#!/bin/bash

mdfile="PWN_Industrial_CTF.md"
tempfile="${mdfile}.tmp"
cp "$mdfile" "$tempfile"

i=1

# Traiter les fichiers dans l'ordre chronologique basé sur leur date dans le nom
for file in $(ls -1 --time=atime | grep "^Pasted image .*\.png$" | sort -k3); do
    new_name=$(printf "PWN_Industrial_%02d.png" "$i")
    # Utiliser sed pour remplacer dans le fichier Markdown (en place)
    sed -i "s|$(printf "%q" "$file")|$new_name|g" "$tempfile"
    ((i++))
done

# Remplacer l'ancien fichier par le modifié
mv "$tempfile" "$mdfile"

echo "✅ Fichier Markdown mis à jour : $mdfile"

