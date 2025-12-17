#!/bin/bash
set -e
set +x

ENV_DIR="/root/infrastructure/consulpam/dev"
mkdir -p "$ENV_DIR"

cat <<EOF > "$ENV_DIR/.env.stage"
DB_PASSWORD=${DB_PASSWORD}
DB_USER=${DB_USER}
DB_NAME=${DB_NAME}
DATABASE_URL=postgresql://${DB_USER}:${DB_PASSWORD}@postgres:5432/${DB_NAME}
EOF

cat <<EOF > "$ENV_DIR/.env.compose"
DOCKERHUB_USERNAME=${DOCKERHUB_USERNAME}
POSTGRES_PASSWORD=${DB_PASSWORD}
EOF

chmod 600 "$ENV_DIR"/.env.*
