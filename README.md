# OllamaStudio — Offline AI App

A local-first Ollama chat application styled to match the OllamaStudio UI shown in the supplied screenshots.

## Features

- Ollama Llama/Qwen/local model selector
- Streaming responses
- Chat history
- Search chat history
- Local JSON database (`data/db.json`)
- Optional local sign-in/sign-up — no Firebase
- Guest chat history in browser localStorage
- Settings and model dialogs
- Light/dark theme
- Fully local Ollama endpoint: `127.0.0.1:11434`
- Production build can be served by the same Node server
- No cloud AI API required

## 1. Install Ollama models

Install Ollama on the computer, then run:

```bash
ollama pull llama3.2
ollama pull qwen2.5:3b
ollama list
```

You can install other models too. They will automatically appear in OllamaStudio.

## 2. Install Node dependencies

```bash
npm install
```

## 3. Development

```bash
npm run dev
```

Open `http://localhost:3000`.

The Vite frontend uses the local API server on `http://localhost:3001`, and that server talks only to local Ollama by default.

## 4. Production local deployment

Build the frontend:

```bash
npm run build
```

Then start the Node server:

```bash
npm start
```

Open `http://localhost:3001`.

The Node server serves the built frontend and the local API from one process.

## 5. Completely offline operation

After Node packages and Ollama models have already been downloaded, disconnect the internet. Start Ollama and the app locally. Chat generation, local authentication and chat history do not require internet access.

Do not use cloud providers or web-search features if you want a strict offline setup.

## 6. Raspberry Pi

The same codebase can run on a Raspberry Pi. Install a compatible 64-bit OS, Node.js and Ollama, then copy this project and install a smaller quantized model suitable for the Pi's RAM/CPU.

For example, a small Qwen model is generally more practical than a large model. The app itself has no Firebase dependency.

For access from another device on the same LAN, run the server on `0.0.0.0` and open `http://PI-IP:3001` from the other device. Ollama itself stays on the Pi.

## Local data

- Accounts: `data/db.json`
- Guest chats: browser localStorage
- No Firebase credentials are required.
