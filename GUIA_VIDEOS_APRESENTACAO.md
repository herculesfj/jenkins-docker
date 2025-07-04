# 🎬 Guia para Vídeos e Apresentação - Jenkins com Docker

## 📋 **Cenários para Demonstrar**

### **🎯 Cenário 1: Tudo Certo! ✅**
**Objetivo**: Demonstrar pipeline funcionando perfeitamente

**Passos para o Vídeo:**
1. Acessar Jenkins: `http://localhost:8081`
2. Configurar job com `Jenkinsfile.alternative`
3. Executar build manualmente
4. Mostrar logs de sucesso
5. Mostrar relatórios de teste (3 testes passando)

**Resultado Esperado:**
- ✅ Build SUCCESS
- ✅ 3 testes passando
- ✅ Relatórios JUnit gerados

---

### **🎯 Cenário 2: Deu Ruim! ❌**
**Objetivo**: Demonstrar falha na compilação

**Passos para o Vídeo:**
1. Mostrar código com erro de sintaxe
2. Executar build no Jenkins
3. Mostrar logs de erro de compilação
4. Explicar o que causou a falha

**Resultado Esperado:**
- ❌ Build FAILURE
- ❌ Erro de sintaxe Java
- ❌ Testes não executados

---

### **🎯 Cenário 3: Tá Instável! ⚠️**
**Objetivo**: Demonstrar build instável (build OK, testes falham)

**Passos para o Vídeo:**
1. Corrigir erro de sintaxe
2. Introduzir erro nos testes
3. Executar build no Jenkins
4. Mostrar build SUCCESS mas testes FAILING
5. Explicar diferença entre FAILURE e UNSTABLE

**Resultado Esperado:**
- ✅ Build SUCCESS
- ❌ 1 teste falhando
- ⚠️ Build UNSTABLE

---

### **🎯 Cenário 4: Nightly Build 🌙**
**Objetivo**: Demonstrar build agendado

**Passos para o Vídeo:**
1. Configurar job com `Jenkinsfile.nightly`
2. Mostrar configuração de cron
3. Simular execução agendada
4. Mostrar logs de execução automática

**Resultado Esperado:**
- ⏰ Build executado automaticamente
- ✅ Build SUCCESS
- 📊 Relatórios gerados

---

## 📊 **Estrutura da Apresentação Google Slides**

### **Slide 1: Título**
- **Título**: "Jenkins com Docker: Integração Contínua Avançada"
- **Subtítulo**: "Demonstração Prática dos 4 Cenários de CI/CD"
- **Autor**: [Seu Nome]
- **Data**: [Data Atual]

### **Slide 2: Objetivos**
- Configurar Jenkins com Docker
- Implementar pipeline de CI/CD
- Demonstrar 4 cenários diferentes
- Mostrar integração com GitHub

### **Slide 3: Arquitetura do Projeto**
- **Projeto Java**: TemperatureConverter
- **Testes**: JUnit 4
- **Build Tool**: Maven
- **CI/CD**: Jenkins
- **Containers**: Docker
- **Versionamento**: Git/GitHub

### **Slide 4: Cenário 1 - Tudo Certo! ✅**
- **Descrição**: Pipeline funcionando perfeitamente
- **Vídeo**: [Link do vídeo]
- **Resultado**: Build SUCCESS, 3 testes passando
- **Tempo**: ~2 minutos

### **Slide 5: Cenário 2 - Deu Ruim! ❌**
- **Descrição**: Falha na compilação
- **Vídeo**: [Link do vídeo]
- **Resultado**: Build FAILURE por erro de sintaxe
- **Tempo**: ~2 minutos

### **Slide 6: Cenário 3 - Tá Instável! ⚠️**
- **Descrição**: Build OK, testes falham
- **Vídeo**: [Link do vídeo]
- **Resultado**: Build UNSTABLE
- **Tempo**: ~2 minutos

### **Slide 7: Cenário 4 - Nightly Build 🌙**
- **Descrição**: Build agendado automático
- **Vídeo**: [Link do vídeo]
- **Resultado**: Execução automática
- **Tempo**: ~2 minutos

### **Slide 8: Configuração do Jenkins**
- **Plugins necessários**: Maven Integration, JUnit
- **Configuração Maven**: Global Tool Configuration
- **Pipeline**: Jenkinsfile
- **GitHub**: Webhook (opcional)

### **Slide 9: Benefícios da Abordagem**
- ✅ **Isolamento**: Containers separados para build e teste
- ✅ **Reprodutibilidade**: Ambiente consistente
- ✅ **Escalabilidade**: Fácil replicação
- ✅ **Automação**: Processo totalmente automatizado

### **Slide 10: Conclusões**
- **Aprendizados**: Integração Jenkins + Docker
- **Próximos passos**: Deploy automatizado, notificações
- **Portfólio**: Projeto completo de CI/CD
- **Contato**: [Suas informações]

---

## 🎥 **Dicas para Gravação dos Vídeos**

### **Ferramentas Recomendadas:**
- **OBS Studio**: Gratuito e profissional
- **Loom**: Online, fácil de usar
- **Screencast-O-Matic**: Simples

### **Configurações de Gravação:**
- **Resolução**: 1920x1080 ou 1280x720
- **FPS**: 30
- **Áudio**: Microfone claro
- **Duração**: 2-3 minutos por cenário

### **Estrutura de Cada Vídeo:**
1. **Introdução** (10s): "Vou demonstrar o Cenário X..."
2. **Configuração** (30s): Mostrar setup necessário
3. **Execução** (1-2min): Executar o pipeline
4. **Resultado** (30s): Mostrar logs e resultados
5. **Conclusão** (10s): Resumo do que aconteceu

### **Elementos Visuais:**
- ✅ **Verde**: Sucesso
- ❌ **Vermelho**: Falha
- ⚠️ **Amarelo**: Instável
- ⏰ **Azul**: Agendado

---

## 📁 **Arquivos do Projeto**

### **Estrutura Final:**
```
jenkins-docker/
├── Jenkinsfile                    # Pipeline principal
├── Jenkinsfile.alternative        # Versão sem Docker
├── Jenkinsfile.nightly           # Build agendado
├── temperature-converter/
│   ├── src/main/java/
│   │   └── TemperatureConverter.java
│   ├── src/test/java/
│   │   └── TemperatureConverterTest.java
│   ├── Dockerfile.build
│   ├── Dockerfile.test
│   └── pom.xml
├── README.md
└── GUIA_VIDEOS_APRESENTACAO.md
```

### **Links Importantes:**
- **Repositório**: https://github.com/herculesfj/jenkins-docker
- **Jenkins**: http://localhost:8081
- **Documentação**: README.md

---

## 🚀 **Checklist Final**

### **Antes da Apresentação:**
- [ ] Todos os 4 cenários implementados
- [ ] Vídeos gravados e editados
- [ ] Apresentação Google Slides criada
- [ ] Links dos vídeos inseridos na apresentação
- [ ] Teste final de todos os cenários

### **Durante a Apresentação:**
- [ ] Explicar cada cenário claramente
- [ ] Mostrar diferenças entre FAILURE e UNSTABLE
- [ ] Destacar benefícios da integração Jenkins + Docker
- [ ] Demonstrar conhecimento técnico
- [ ] Estar preparado para perguntas

### **Após a Apresentação:**
- [ ] Compartilhar código fonte
- [ ] Disponibilizar vídeos
- [ ] Documentar aprendizados
- [ ] Atualizar portfólio

---

**🎯 Objetivo Final**: Criar uma apresentação profissional que demonstre domínio completo de Jenkins com Docker para CI/CD! 