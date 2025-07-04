pipeline {
    agent any
    
    stages {
        stage('Build in Docker Container') {
            agent {
                docker {
                    image 'maven:3.9.6-eclipse-temurin-17'
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                dir('temperature-converter') {
                    script {
                        // Build usando container Docker isolado
                        sh '''
                            docker build -f Dockerfile.build -t temperature-converter-build .
                            docker run --rm temperature-converter-build
                        '''
                    }
                }
            }
        }
        
        stage('Test in Docker Container') {
            agent {
                docker {
                    image 'maven:3.9.6-eclipse-temurin-17'
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                dir('temperature-converter') {
                    script {
                        // Test usando container Docker isolado
                        sh '''
                            docker build -f Dockerfile.test -t temperature-converter-test .
                            docker run --rm temperature-converter-test
                        '''
                    }
                }
            }
            post {
                always {
                    // Copiar relatórios de teste do container
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
            // Limpeza dos containers
            sh 'docker rmi temperature-converter-build temperature-converter-test || true'
        }
    }
}
