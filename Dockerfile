# Use Coqui’s official GPU image as base
FROM ghcr.io/coqui-ai/tts:latest

# Set working directory
WORKDIR /app

#Copy in script
COPY ./script.py .

EXPOSE 5002

# Set default entrypoint so custom commands can be passed at runtime
ENTRYPOINT ["bash", "-c"]
