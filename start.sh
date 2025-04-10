#!/bin/bash

set -e

IMAGE_NAME="coqui-tts-gpu"
OUT_FILE="output/output.wav"

mkdir -p output

echo "🚀 Starting Coqui TTS server with CUDA..."

docker run --name coqui \
  --gpus all \
  -v coqui_cache_gpu:/root/.local/share/tts-gpu \
  -v "$(pwd)/output":/app/output \
  -v "$(pwd)/script.py":/app/script.py \
  -p 5002:5002 \
  $IMAGE_NAME \
  "python3 /app/script.py"

echo "✅ Server exited. Output saved to: $OUT_FILE"
