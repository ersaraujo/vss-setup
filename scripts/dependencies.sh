#!/bin/bash

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

if ! command_exists docker; then
  echo "Docker não está instalado. Por favor, instale o Docker antes de continuar."
  exit 1
fi

if ! command_exists docker-compose; then
  echo "Docker Compose não está instalado. Instalando Docker Compose..."
  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo "Docker Compose foi instalado com sucesso."
fi
