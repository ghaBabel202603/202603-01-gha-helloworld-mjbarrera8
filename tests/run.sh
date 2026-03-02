#!/bin/bash

FILE=".github/workflows/workflow.yml"

echo "🔎 Checking if workflow file exists..."

if [ ! -f "$FILE" ]; then
  echo "❌ workflow.yml no existe"
  exit 1
fi

echo "✅ File exists"

echo "🔎 Checking workflow name..."

grep -q "name: HELLO WORLD" "$FILE" || { echo "❌ El workflow no se llama HELLO WORLD"; exit 1; }

echo "🔎 Checking trigger push..."

grep -q "push" "$FILE" || { echo "❌ No tiene trigger push"; exit 1; }

echo "🔎 Checking job Saludo..."

grep -q "Saludo:" "$FILE" || { echo "❌ No existe el job Saludo"; exit 1; }

echo "🔎 Checking ubuntu-latest..."

grep -q "runs-on: ubuntu-latest" "$FILE" || { echo "❌ No usa ubuntu-latest"; exit 1; }

echo "🔎 Checking Hola mundo message..."

grep -q "¡Hola, mundo!" "$FILE" || { echo "❌ No imprime ¡Hola, mundo!"; exit 1; }

echo "🎉 Todo correcto!"
exit 0
