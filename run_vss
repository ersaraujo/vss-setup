#!/bin/bash

scripts_folder="./scripts"

if [ ! -d "$scripts_folder" ]; then
  echo "A pasta de scripts não foi encontrada."
  exit 1
fi

find "$scripts_folder" -type f -name "*.sh" -exec chmod +x {} \;

for script in "$scripts_folder"/*.sh; do
  if [ -x "$script" ]; then
    echo "Executando script: $script"
    "$script"
  fi
done
