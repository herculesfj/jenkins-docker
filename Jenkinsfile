pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                dir('temperature-converter') {
                    sh 'docker run --rm -v ${WORKSPACE}/temperature-converter:/app -w /app maven:3.9.6-eclipse-temurin-17 mvn clean package -DskipTests'
                }
            }
        }
        stage('Test') {
            steps {
                dir('temperature-converter') {
                    sh 'docker run --rm -v ${WORKSPACE}/temperature-converter:/app -w /app maven:3.9.6-eclipse-temurin-17 mvn test'
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
