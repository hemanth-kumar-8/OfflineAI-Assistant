@echo off
setlocal
where ollama >nul 2>&1
if errorlevel 1 (
  echo Ollama is not installed or not in PATH.
  pause
  exit /b 1
)
start "Ollama" ollama serve
 timeout /t 2 /nobreak >nul
if not exist node_modules (
  echo Installing Node dependencies. Internet is required only for this first setup.
  call npm install
  if errorlevel 1 pause & exit /b 1
)
call npm run build
if errorlevel 1 pause & exit /b 1
start "OllamaStudio" http://localhost:3001
call npm start
