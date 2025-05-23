#!/bin/bash

# Start Ollama server in the background
ollama serve &

# Wait for it to be ready
echo "Waiting for Ollama to be ready..."
until curl -s http://localhost:11434/api/tags > /dev/null; do
  sleep 1
done

# Pull model
echo "Pulling model..."
ollama pull llama3

# Keep server running
wait
