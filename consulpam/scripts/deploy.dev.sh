#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Iniciando deploy STAGE"

# === Validação mínima ===
required_vars=(
  USER_DOCKER
  DOCKERHUB_TOKEN
  GITHUB_SHA
)

for var in "${required_vars[@]}"; do
  if [ -z "${!var:-}" ]; then
    echo "❌ Variável obrigatória não definida: $var"
    exit 1
  fi
done

# === Login Docker Hub ===
echo "🔐 Login no Docker Hub"
echo "$DOCKERHUB_TOKEN" | docker login -u "$USER_DOCKER" --password-stdin

# === Rollback (preserva latest) ===
if docker pull "$USER_DOCKER/backend-dev-consulpam:latest" > /dev/null 2>&1; then
  docker tag "$USER_DOCKER/backend-dev-consulpam:latest" \
             "$USER_DOCKER/backend-dev-consulpam:rollback"
  docker push "$USER_DOCKER/backend-dev-consulpam:rollback"
fi

# === Pull nova imagem ===
echo "📦 Pull imagem $GITHUB_SHA"
docker pull "$USER_DOCKER/backend-dev-consulpam:$GITHUB_SHA"
docker tag  "$USER_DOCKER/backend-dev-consulpam:$GITHUB_SHA" \
            "$USER_DOCKER/backend-dev-consulpam:latest"

# === Renderiza envs ===
echo "🧩 Gerando arquivos .env"
./dev/env.stage.sh

# === Subida dos containers ===
echo "🐳 Atualizando backend sem downtime"
cd dev
docker compose pull api
docker compose up -d --no-deps api

echo "✅ Deploy STAGE finalizado com sucesso"
