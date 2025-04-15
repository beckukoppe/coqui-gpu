#!/bin/bash

set -e

IMAGE_NAME="coqui-tts-gpu"

echo "🚀 Starting Coqui TTS server with CUDA..."

docker run --rm \
  --gpus all \
  -v coqui_cache_gpu:/root/.local/share/tts \
  -v "$(pwd)/output":/app/output \
  -p 5002:5002 \
  $IMAGE_NAME \
  "./script.sh"

echo "✅ Server exited."
