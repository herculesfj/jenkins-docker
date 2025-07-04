# Terceira Atividade Prática - Jenkins com Docker

## Descrição
Este projeto implementa a terceira atividade prática sobre **Jenkins com Docker** para Integração Contínua.

## Objetivo
Usar o Jenkins com Docker em um pipeline para realizar builds e testes em containers isolados.

## Estrutura do Projeto

### 1. Projeto Java
- **Classe Principal**: `TemperatureConverter.java`
  - Método `fahrenheitToCelsius(double f)`: Converte Fahrenheit para Celsius
  - Método `celsiusToFahrenheit(double c)`: Converte Celsius para Fahrenheit

### 2. Testes JUnit
- **Arquivo**: `TemperatureConverterTest.java`
  - `testFahrenheitToCelsius()`: Testa conversão F → C
  - `testCelsiusToFahrenheit()`: Testa conversão C → F
  - `testFailingTest()`: Teste que falha para demonstrar build instável

### 3. Containers Docker
- **Dockerfile.build**: Container para compilação do projeto
- **Dockerfile.test**: Container para execução de testes

### 4. Pipeline Jenkins
- **Jenkinsfile**: Pipeline que usa containers Docker isolados
  - Stage "Build in Docker Container": Compila o projeto em container isolado
  - Stage "Test in Docker Container": Executa testes em container isolado

## Configuração do Ambiente

### Pré-requisitos
- Docker instalado e configurado
- Jenkins rodando em container Docker
- Git configurado

### Passos para Execução

1. **Iniciar Jenkins**:
   ```bash
   docker run -d -p 8081:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts
   ```

2. **Configurar Jenkins**:
   - Acessar http://localhost:8081
   - Instalar plugins recomendados
   - Configurar credenciais do GitHub
   - Criar pipeline conectado ao repositório

3. **Executar Pipeline**:
   - O Jenkins irá automaticamente:
     - Fazer checkout do código
     - Executar build em container Docker isolado
     - Executar testes em container Docker isolado
     - Gerar relatórios de teste

## Funcionalidades Implementadas

### ✅ Requisitos Atendidos

1. **Jenkins configurado localmente** ✅
2. **Integração com projeto GitHub** ✅
3. **Código Java com 2 métodos simples** ✅
   - Conversão Fahrenheit → Celsius
   - Conversão Celsius → Fahrenheit
4. **Mínimo 2 casos de teste** ✅
   - Teste de conversão F → C
   - Teste de conversão C → F
   - Teste adicional para demonstrar falha
5. **Build em container Docker isolado** ✅
6. **Testes em container Docker isolado** ✅

### 🔧 Tecnologias Utilizadas

- **Java 17** com Maven
- **JUnit 4** para testes
- **Docker** para containers isolados
- **Jenkins** para CI/CD
- **GitHub** para versionamento

## Execução Local

Para testar localmente:

```bash
# Build
cd temperature-converter
docker build -f Dockerfile.build -t temperature-converter-build .
docker run --rm temperature-converter-build

# Test
docker build -f Dockerfile.test -t temperature-converter-test .
docker run --rm temperature-converter-test
```

## Resultados Esperados

- ✅ Build bem-sucedido em container isolado
- ✅ Testes executados em container isolado
- ✅ Relatórios de teste gerados
- ✅ Pipeline Jenkins funcional

## Autor
Desenvolvido para a disciplina de Integração Contínua - 2025.1