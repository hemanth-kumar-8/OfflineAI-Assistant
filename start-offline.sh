#!/usr/bin/env bash
set -e
ollama serve >/tmp/ollama.log 2>&1 &
sleep 2
if [ ! -d node_modules ]; then npm install; fi
npm run build
npm start
