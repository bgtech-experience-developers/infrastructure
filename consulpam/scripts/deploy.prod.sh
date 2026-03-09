#!/usr/bin/env bash
set -e

echo "🚀 Iniciando deploy PROD"

# 1. Gera os envs
chmod +x ./production/generate-env.sh
./production/generate-env.sh

# 2. Login Docker (se necessário)
echo "$DOCKERHUB_TOKEN" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

# 3. Atualiza imagem e container
cd production

# docker compose pull api
# docker compose up -d --no-deps --force-recreate api
docker compose --env-file .env.compose up --pull always --force-recreate -d

echo "✅ Deploy STAGE finalizado"
