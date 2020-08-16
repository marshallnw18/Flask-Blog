pipeline {
    agent any
        stages {
            stage('Clone repository') {
                /* Cloning the repo to our workspace */
                steps {
                    checkout scm
                }
            }

            stage('Build Image') {
                steps {
                    sh 'sudo docker build -t flask-blog:v1 .'
                }
            }

            stage('Run Image') {
                steps {
                    sh 'sudo docker run -d -p 5000:5000 --name flaskblog flask-blog:v1'
                }
            }

            stage('Testing') {
                steps {
                    echo 'Testing...'
                }
            }
        }
}