pipeline {
    agent any
        stages {
            stage('Clone repository') {
                /* Cloning the repo to our workspace */
                steps {
                    checkout scm
                }
            }

            
            stage('SSH transfer') {
                steps {
                sshPublisher(
                continueOnError: false, failOnError: true,
                publishers: [
                    sshPublisherDesc(
                    configName: "Docker Server",
                    verbose: true,
                    transfers: [
                    sshTransfer(
                    sourceFiles: "**",
                    remoteDirectory: "//opt//docker",
                    execCommand: "docker stop flask_container", "docker rm -f flask_container", "docker image rm -f flaskblog:v1",
                                    "cd /opt/docker", "docker build -t flaskblog:v1 ."
                    )
                    ])
                ])
                }
            }

            stage('Testing') {
                steps {
                    echo 'Testing...'
                }
            }
        }
}