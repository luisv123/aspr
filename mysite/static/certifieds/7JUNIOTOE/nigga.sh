#!/bin/bash

for file in *.png; do
  # Extraer el número del nombre del archivo (antes del .png)
  num="${file%.png}"

  # Verificar si es un número y mayor a 100
  if [[ "$num" =~ ^[0-9]+$ ]] && (( num > 100 )); then
    new_num=$((num + 1))
    new_name="${new_num}.png"

    # Renombrar el archivo
    mv "$file" "$new_name"
    echo "Renombrado: $file → $new_name"
  fi
done

