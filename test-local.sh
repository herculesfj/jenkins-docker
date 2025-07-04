#!/bin/bash

echo "=== Testando Build e Testes Localmente ==="

cd temperature-converter

echo "1. Testando Build..."
docker build -f Dockerfile.build -t temperature-converter-build .
if [ $? -eq 0 ]; then
    echo "✅ Build executado com sucesso!"
else
    echo "❌ Falha no build"
    exit 1
fi

echo "2. Testando Execução de Testes..."
docker build -f Dockerfile.test -t temperature-converter-test .
if [ $? -eq 0 ]; then
    echo "✅ Container de teste criado com sucesso!"
else
    echo "❌ Falha na criação do container de teste"
    exit 1
fi

echo "3. Executando Testes..."
docker run --rm temperature-converter-test
if [ $? -eq 0 ]; then
    echo "✅ Testes executados com sucesso!"
else
    echo "❌ Falha na execução dos testes"
    exit 1
fi

echo "=== Todos os testes locais passaram! ===" 