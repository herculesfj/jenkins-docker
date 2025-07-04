pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                dockerfile {
                    filename 'temperature-converter/Dockerfile.build'
                    dir 'temperature-converter'
                }
            }
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Test') {
            agent {
                dockerfile {
                    filename 'temperature-converter/Dockerfile.test'
                    dir 'temperature-converter'
                }
            }
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'temperature-converter/target/surefire-reports/*.xml'
                }
            }
        }
    }
}
