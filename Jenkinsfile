pipeline {
    agent any
        stages {
            stage('Clone repository') {
                /* Cloning the repo to our workspace */
                steps {
                    echo 'Checking out source control...'
                    checkout scm
                }
            }

            /* Transferring project files to Docker Server */
            stage('Project Files Transfer') {
                steps {
                    echo 'Transferring project files and building container image...'
                    sshPublisher(
                        publishers: [
                            sshPublisherDesc(configName: 'Docker Server', 
                            transfers: [
                            /* Building the application image */
                                sshTransfer(
                                    cleanRemote: false, 
                                    excludes: '', 
                                    execCommand: '''# Stop previous running container and remove it
                                    docker stop flask_container; 
                                    docker rm -f flask_container; 
                                    # Remove previous built image
                                    docker image rm -f flaskblog:v1; 
                                    cd /opt/docker; 
                                    # Build new image
                                    docker build -t flaskblog:v1 . ''', 
                                    execTimeout: 120000, 
                                    flatten: false, 
                                    makeEmptyDirs: false, 
                                    noDefaultExcludes: false, 
                                    patternSeparator: '[, ]+', 
                                    remoteDirectory: '//opt//docker', 
                                    remoteDirectorySDF: false, 
                                    removePrefix: '', 
                                    sourceFiles: '**'), 
                                /* Running the application container */
                                sshTransfer(
                                    cleanRemote: false, 
                                    excludes: '', 
                                    execCommand: '''# Run new container from new image
                                    docker run -itd --name flask_container -p 8090:5000 flaskblog:v1''', 
                                    execTimeout: 120000, 
                                    flatten: false, 
                                    akeEmptyDirs: false, 
                                    noDefaultExcludes: false, 
                                    patternSeparator: '[, ]+', 
                                    remoteDirectory: '', 
                                    remoteDirectorySDF: false, 
                                    removePrefix: '', 
                                    sourceFiles: '')
                                    ], 
                                usePromotionTimestamp: false, 
                                useWorkspaceInPromotion: false, 
                                verbose: false)
                        ])
                    }
            }

            stage('Testing') {
                steps {
                    echo 'Flask Blog Deployment Complete!'
                }
            }
        }
}