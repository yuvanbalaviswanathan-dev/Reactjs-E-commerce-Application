pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'yuvanbalaviswanathan'
        DEV_IMAGE = 'yuvanbalaviswanathan/reactjs-e-commerce-dev'
        PROD_IMAGE = 'yuvanbalaviswanathan/reactjs-e-commerce-prod'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t reactjs-ecommerce:build .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh 'echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    if (env.GIT_BRANCH == 'origin/dev') {
                        sh """
                            docker tag reactjs-ecommerce:build ${DEV_IMAGE}:dev
                            docker push ${DEV_IMAGE}:dev
                        """
                    } else if (env.GIT_BRANCH == 'origin/master') {
                        sh """
                            docker tag reactjs-ecommerce:build ${PROD_IMAGE}:prod
                            docker push ${PROD_IMAGE}:prod
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'docker logout || true'
        }
    }
}