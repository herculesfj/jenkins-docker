# Jenkins com Docker - Atividade Prática

Este projeto demonstra a integração do Jenkins com Docker para realizar builds e testes em containers isolados.

## Estrutura do Projeto

```
jenkins-docker/
├── Jenkinsfile                    # Pipeline do Jenkins
├── README.md                      # Este arquivo
└── temperature-converter/         # Projeto Java de exemplo
    ├── pom.xml                    # Configuração Maven
    ├── Dockerfile.build           # Container para build
    ├── Dockerfile.test            # Container para testes
    └── src/
        ├── main/java/
        │   └── TemperatureConverter.java
        └── test/java/
            └── TemperatureConverterTest.java
```

## Funcionalidades

- **TemperatureConverter**: Classe Java com dois métodos de conversão de temperatura
  - `fahrenheitToCelsius(double f)`: Converte Fahrenheit para Celsius
  - `celsiusToFahrenheit(double c)`: Converte Celsius para Fahrenheit

- **Testes Automatizados**: Dois casos de teste usando JUnit 4

## Pipeline Jenkins

O pipeline executa:
1. **Build Stage**: Compila o projeto em container Docker separado
2. **Test Stage**: Executa os testes em outro container Docker

## Cenários Demonstrados

1. **Cenário 1**: Build e testes executam com sucesso
2. **Cenário 2**: Build falha durante compilação
3. **Cenário 3**: Build OK, mas testes falham (build instável)
4. **Cenário 4**: Build agendado (nightly)

## Como Executar

1. Clone o repositório
2. Configure o Jenkins com os plugins necessários
3. Crie um pipeline apontando para este repositório
4. Execute o pipeline manualmente ou agende execuções

## Plugins Jenkins Necessários

- Docker Pipeline
- GitHub Integration
- Pipeline
- JUnit