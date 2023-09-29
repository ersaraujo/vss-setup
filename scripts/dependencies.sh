#!/bin/bash

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

if ! command_exists docker; then
  echo "[DEPENDENCIES] - Docker is not installed. Install before continuing."
  exit 1
fi

if ! command_exists docker-compose; then
  echo "[DEPENDENCIES] - Docker Compose is not installed."
  echo "[DEPENDENCIES] - Installing Docker Compose..."
  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo "DEPENDENCIES] - Docker Compose has been installed successfully."
fi
