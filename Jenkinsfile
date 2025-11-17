pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-cred'
        DOCKER_IMAGE = "deepikaaax/my-demo-app"
    }

    stages {

        stage('Checkout Source') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                bat """
                docker build -t %DOCKER_IMAGE% .
                """
            }
        }

        stage('DockerHub Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: env.DOCKERHUB_CREDENTIALS,
                                                 usernameVariable: 'USER',
                                                 passwordVariable: 'PASS')]) {
                    bat """
                    docker login -u %USER% -p %PASS%
                    """
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                bat """
                docker push %DOCKER_IMAGE%
                """
            }
        }
    }

    post {
        always {
            echo "Pipeline completed."
        }
    }
}
