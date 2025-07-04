pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                dir('temperature-converter') {
                    sh 'docker build -f Dockerfile.build -t build-container .'
                    sh 'docker run --rm -v ${WORKSPACE}/temperature-converter:/app build-container mvn clean package -DskipTests'
                }
            }
        }
        stage('Test') {
            steps {
                dir('temperature-converter') {
                    sh 'docker build -f Dockerfile.test -t test-container .'
                    sh 'docker run --rm -v ${WORKSPACE}/temperature-converter:/app test-container mvn test'
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
