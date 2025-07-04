# Script para executar pipeline no Jenkins
Write-Host "=== Executando Pipeline no Jenkins ===" -ForegroundColor Green

# Verificar se o Jenkins está rodando
Write-Host "1. Verificando se o Jenkins está rodando..." -ForegroundColor Yellow
$jenkinsRunning = docker ps --filter "name=jenkins" --format "table {{.Names}}" | Select-String "jenkins"
if ($jenkinsRunning) {
    Write-Host "✅ Jenkins está rodando!" -ForegroundColor Green
} else {
    Write-Host "❌ Jenkins não está rodando. Iniciando..." -ForegroundColor Red
    docker run -d -p 8081:8080 -v /var/run/docker.sock:/var/run/docker.sock --name jenkins jenkins/jenkins:lts
    Start-Sleep -Seconds 30
}

# Abrir Jenkins no navegador
Write-Host "2. Abrindo Jenkins no navegador..." -ForegroundColor Yellow
Start-Process "http://localhost:8081"

Write-Host "3. Instruções para executar o pipeline:" -ForegroundColor Cyan
Write-Host "   a) Acesse http://localhost:8081" -ForegroundColor White
Write-Host "   b) Faça login no Jenkins" -ForegroundColor White
Write-Host "   c) Crie um novo Pipeline Job:" -ForegroundColor White
Write-Host "      - Nome: jenkins-docker-pipeline" -ForegroundColor White
Write-Host "      - Pipeline: From SCM" -ForegroundColor White
Write-Host "      - SCM: Git" -ForegroundColor White
Write-Host "      - Repository URL: https://github.com/herculesfj/jenkins-docker.git" -ForegroundColor White
Write-Host "      - Branch: main" -ForegroundColor White
Write-Host "      - Script Path: Jenkinsfile" -ForegroundColor White
Write-Host "   d) Salve e execute o pipeline" -ForegroundColor White

Write-Host "4. Para executar via API (quando job estiver configurado):" -ForegroundColor Cyan
Write-Host "   curl -X POST http://localhost:8081/job/jenkins-docker-pipeline/build" -ForegroundColor Gray

Write-Host "=== Pipeline configurado para usar containers Docker isolados ===" -ForegroundColor Green
Write-Host "✅ Build em container Docker isolado" -ForegroundColor Green
Write-Host "✅ Testes em container Docker isolado" -ForegroundColor Green
Write-Host "✅ Relatórios de teste integrados" -ForegroundColor Green 