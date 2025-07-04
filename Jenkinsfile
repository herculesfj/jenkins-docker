pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                dockerfile {
                    filename 'Dockerfile.build'
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
                    filename 'Dockerfile.test'
                    dir 'temperature-converter'
                }
            }
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
}
