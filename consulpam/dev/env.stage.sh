#!/usr/bin/env bash
set -e

ENV_DIR="/root/infrastructure/consulpam/dev"
mkdir -p "$ENV_DIR"

: "${DB_PASSWORD:?DB_PASSWORD não definida}"
: "${DB_USER:?DB_USER não definida}"
: "${DB_NAME:?DB_NAME não definida}"
: "${DOCKERHUB_USERNAME:?DOCKERHUB_USERNAME não definida}"

cat <<EOF > "$ENV_DIR/.env.stage"
DB_PASSWORD=$DB_PASSWORD
DB_USER=$DB_USER
DB_NAME=$DB_NAME
DATABASE_URL=postgresql://$DB_USER:$DB_PASSWORD@postgres:5432/$DB_NAME
EOF

cat <<EOF > "$ENV_DIR/.env.compose"
DOCKERHUB_USERNAME=$DOCKERHUB_USERNAME
POSTGRES_PASSWORD=$DB_PASSWORD
EOF

chmod 600 "$ENV_DIR"/.env.*

echo "🧩 Arquivos .env gerados"
