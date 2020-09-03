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
            script {
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
                execCommand: "# Stop previous running container and remove it
                                docker stop flask_container; 
                                docker rm -f flask_container; 
                                # Remove previous built image
                                docker image rm -f flaskblog:v1; 
                                cd /opt/docker; 
                                # Build new image
                                docker build -t flaskblog:v1 . "
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