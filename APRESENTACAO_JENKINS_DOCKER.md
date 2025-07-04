# Terceira Atividade Prática: Jenkins com Docker

## Implementação Completa de Integração Contínua com Containers Isolados

**Autor:** Hercules  
**Disciplina:** Integração Contínua - 2025.1  
**Data:** Julho 2025  
**Repositório:** https://github.com/herculesfj/jenkins-docker

---

## Objetivos da Atividade

- Configurar Jenkins localmente com Docker
- Integrar com projeto GitHub
- Criar código Java com 2 métodos simples
- Implementar testes JUnit (mínimo 2 casos)
- Demonstrar 4 cenários de build e teste
- Usar containers Docker isolados para build e teste

**Tecnologias Utilizadas:**
- Java 17 + Maven
- JUnit 4 para testes
- Jenkins para CI/CD
- Docker para containers
- Git/GitHub para versionamento

---

## Projeto Java Implementado

**Classe principal:**
```java
public class TemperatureConverter {
    public static double fahrenheitToCelsius(double f) {
        return (f - 32) * 5 / 9;
    }
    public static double celsiusToFahrenheit(double c) {
        return (c * 9 / 5) + 32;
    }
}
```

**Testes JUnit:**
```java
@Test
public void testFahrenheitToCelsius() {
    assertEquals(0.0, TemperatureConverter.fahrenheitToCelsius(32), 0.001);
    assertEquals(100.0, TemperatureConverter.fahrenheitToCelsius(212), 0.001);
}
@Test
public void testCelsiusToFahrenheit() {
    assertEquals(32.0, TemperatureConverter.celsiusToFahrenheit(0), 0.001);
    assertEquals(212.0, TemperatureConverter.celsiusToFahrenheit(100), 0.001);
}
```

**Estrutura do Projeto:**
- `temperature-converter/` - Projeto Maven
- `src/main/java/` - Código fonte
- `src/test/java/` - Testes
- `pom.xml` - Configuração Maven

---

## Containers Docker Criados

**Dockerfile.build:**
```dockerfile
FROM maven:3.9.6-eclipse-temurin-17
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
```

**Dockerfile.test:**
```dockerfile
FROM maven:3.9.6-eclipse-temurin-17
WORKDIR /app
COPY . .
CMD ["mvn", "test"]
```

**Benefícios dos Containers:**
- Isolamento: Build e teste em containers separados
- Reprodutibilidade: Mesmo ambiente sempre
- Portabilidade: Funciona em qualquer sistema
- Escalabilidade: Fácil replicação

---

## Configuração Inicial do Jenkins

1. Instalar Jenkins com Docker:
   ```bash
   docker run -d -p 8081:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts
   ```
2. Configurar Jenkins:
   - Acessar: http://localhost:8081
   - Instalar plugins: Maven Integration, JUnit
   - Configurar Maven globalmente
   - Extrair senha inicial do container
3. Criar Pipeline Job:
   - Novo Job → Pipeline
   - SCM: Git
   - Repository: https://github.com/herculesfj/jenkins-docker.git
   - Script Path: Jenkinsfile.alternative
4. Configurar GitHub:
   - Push automático para trigger de builds
   - Webhook configurado

---

## Jenkinsfile Implementado

**Jenkinsfile.alternative (Versão Funcional):**
```groovy
pipeline {
    agent any
    tools { maven 'Maven 3' }
    stages {
        stage('Build') {
            steps {
                dir('temperature-converter') {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }
        stage('Test') {
            steps {
                dir('temperature-converter') {
                    sh 'mvn test'
                }
            }
            post {
                always {
                    junit 'temperature-converter/target/surefire-reports/*.xml'
                }
            }
        }
    }
}
```

**Jenkinsfile Original (com Docker):**
```groovy
pipeline {
    agent any
    stages {
        stage('Build in Docker Container') {
            steps {
                dir('temperature-converter') {
                    script {
                        sh '''
                            docker build -f Dockerfile.build -t temperature-converter-build .
                            docker run --rm temperature-converter-build
                        '''
                    }
                }
            }
        }
        stage('Test in Docker Container') {
            steps {
                dir('temperature-converter') {
                    script {
                        sh '''
                            docker build -f Dockerfile.test -t temperature-converter-test .
                            docker run --rm temperature-converter-test
                        '''
                    }
                }
            }
            post {
                always {
                    sh '''
                        docker create --name temp-container temperature-converter-test
                        docker cp temp-container:/app/target/surefire-reports ./target/
                        docker rm temp-container
                    '''
                    junit 'temperature-converter/target/surefire-reports/*.xml'
                }
            }
        }
    }
    post {
        always {
            sh 'docker rmi temperature-converter-build temperature-converter-test || true'
        }
    }
}
```

---

## Execução dos Cenários

### Cenário 1: Pipeline funcionando perfeitamente
- Jenkinsfile: `Jenkinsfile.alternative`
- Código sem erros, todos os testes passando
- Build e testes executados manualmente no Jenkins
- Resultado: Build SUCCESS, Test SUCCESS, 3 testes executados, relatórios JUnit gerados

### Cenário 2: Falha na compilação
- Introduzido erro de sintaxe no arquivo `TemperatureConverter.java`:
  ```java
  if (true {  // Erro: falta parêntese
      System.out.println("Erro de sintaxe");
  }
  ```
- Commit e push para o GitHub
- Build executado no Jenkins
- Resultado: Build FAILURE, erro de compilação, testes não executados

### Cenário 3: Build instável (testes falham)
- Corrigido erro de sintaxe no código
- Introduzido erro em um teste:
  ```java
  assertEquals(50.0, TemperatureConverter.fahrenheitToCelsius(32), 0.001);
  // Esperado: 50.0, Real: 0.0
  ```
- Commit e push para o GitHub
- Build executado no Jenkins
- Resultado: Build SUCCESS, Teste UNSTABLE, 1 teste falhando

### Cenário 4: Build agendado automático
- Criado `Jenkinsfile.nightly` com trigger cron:
  ```groovy
  triggers {
      cron('0 2 * * *')
  }
  ```
- Commit e push para o GitHub
- Job configurado para execução automática
- Resultado: Build e testes executados automaticamente, relatórios gerados

---

## Benefícios da Abordagem

- Isolamento completo: Containers separados para build e teste
- Reprodutibilidade: Mesmo ambiente em qualquer máquina
- Escalabilidade: Fácil adição de novos stages
- Automação total: Processo 100% automatizado
- Portabilidade: Funciona em qualquer sistema

---

## Aprendizados e Próximos Passos

**Conhecimentos Adquiridos:**
- Configuração de pipeline Jenkins
- Uso de containers Docker para build/teste
- Integração com GitHub
- Automação de builds e testes
- Interpretação de logs e relatórios

**Próximos Passos:**
- Deploy automatizado
- Notificações por email/Slack
- Monitoramento de builds
- Integração com outros sistemas

---

## Contato e Recursos

- **Autor:** Hercules
- **GitHub:** https://github.com/herculesfj/jenkins-docker
- **Repositório:** https://github.com/herculesfj/jenkins-docker
- **Documentação:** README.md completo
- **Jenkins:** http://localhost:8081

---

**FIM** 