@Library('shared-library') _

pipeline {
    agent any

    parameters {
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: 'javapp')
        string(name: 'imageTag', description: "tag of the docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser', description: "name of the application", defaultValue: 'naruto1995')
    }

    stages {
        stage('git checkout') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                node('worker') {
                    script {
                        gitCheckout(
                            branch: "main",
                            url: "https://github.com/vigi06/full-devops-project.git"
                        )
                    }
                }
            }
        }

        stage('Unit Testing') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                node('worker') {
                    script {
                        mvnTest()
                    }
                }
            }
        }

        stage('Integration Testing') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                node('worker') {
                    script {
                        mvnIntegrationTest()
                    }
                }
            }
        }

        stage('Build using maven') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                node('worker') {
                    script {
                        mvnBuild()
                    }
                }
            }
        }

        stage('Docker build') {
            when {
                expression { params.action == 'create' }
            }
            steps {
                node('worker') {
                    script {
                        dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
                    }
                }
            }
        }
    }
}
