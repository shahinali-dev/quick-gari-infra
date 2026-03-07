#!/bin/bash
# Docker Hub username
DOCKER_USER="shahinali1998"
TAG="latest"

echo "🔨 Building backend..."
docker build -t $DOCKER_USER/quick-gari-backend:$TAG \
  --target production \
  ./quick-gari

echo "🔨 Building dashboard..."
docker build -t $DOCKER_USER/quick-gari-dashboard:$TAG \
  --build-arg VITE_API_URL=${VITE_API_URL} \
  ./quick-gari-dashboard

echo "📤 Pushing images..."
docker push $DOCKER_USER/quick-gari-backend:$TAG
docker push $DOCKER_USER/quick-gari-dashboard:$TAG

echo "✅ Done! Now run: docker compose pull && docker compose up -d on VPS"