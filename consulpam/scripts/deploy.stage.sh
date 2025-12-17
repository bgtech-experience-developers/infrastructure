#!/usr/bin/env bash
set -e

echo "🚀 Iniciando deploy STAGE"

# 1. Gera os envs
chmod x+ ./dev/env.stage.sh

# 2. Login Docker (se necessário)
echo "$DOCKERHUB_TOKEN" | docker login -u "$USER_DOCKER" --password-stdin

# 3. Atualiza imagem e container
cd dev

docker compose pull api
docker compose up -d --no-deps --force-recreate api

echo "✅ Deploy STAGE finalizado"
