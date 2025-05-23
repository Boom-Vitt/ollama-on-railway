#!/bin/bash

# Start Ollama server in the background
ollama serve &

# Wait for it to be ready
echo "Waiting for Ollama to be ready..."
until wget -q --spider http://localhost:11434/api/tags; do
  sleep 1
done


# Pull model
echo "Pulling model..."
ollama pull llama3.2:1b

# Keep server running
wait
