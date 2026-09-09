pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'yuvanbalaviswanathan'
        DEV_IMAGE = 'yuvanbalaviswanathan/reactjs-e-commerce-dev'
        PROD_IMAGE = 'yuvanbalaviswanathan/reactjs-e-commerce-prod'
        EC2_HOST = '13.233.131.201'
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

        stage('Deploy to EC2') {
            when {
                expression {
                    env.GIT_BRANCH == 'origin/master'
                }
            }
            steps {
                withCredentials([sshUserPrivateKey(
                    credentialsId: 'ec2-ssh-key',
                    keyFileVariable: 'SSH_KEY',
                    usernameVariable: 'SSH_USER'
                )]) {
                    sh """
                        chmod 600 "$SSH_KEY"

                        ssh -o StrictHostKeyChecking=no -i "$SSH_KEY" "$SSH_USER@${EC2_HOST}" '
                            docker pull ${PROD_IMAGE}:prod &&
                            docker stop reactjs-ecommerce-prod || true &&
                            docker rm reactjs-ecommerce-prod || true &&
                            docker run -d --name reactjs-ecommerce-prod -p 80:80 ${PROD_IMAGE}:prod
                        '
                    """
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