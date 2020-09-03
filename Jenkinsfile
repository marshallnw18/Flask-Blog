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
                    publishers: [
                        sshPublisherDesc(
                            configName: 'Docker Server', 
                            transfers: [
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
                                    removePrefix: '', sourceFiles: '**')
                                    ], 
                            usePromotionTimestamp: false, 
                            useWorkspaceInPromotion: false, 
                            verbose: false)
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
