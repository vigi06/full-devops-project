@Library('shared-library') _

pipeline{

    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
    }

    stages{
        
        stage('git checkout'){
        when { expression { param.action == 'create'} }    
            steps{

                script{
                    gitCheckout(
                        branch: "main",
                        url: "https://github.com/vigi06/full-devops-project.git"
                    )
                }
            }
        }

        
        stage('Unit Testing'){
        when { expression { param.action == 'create'} }     
            steps{

                script{
                    mvnTest()
                }
            }
        }
        

        stage('Integration Testing'){
        when { expression { param.action == 'create'} }    
            steps{

                script{
                    mvnIntegrationTest()
                }
            }
        }

        stage('Static code analysis: Sonarqube'){
        when { expression { param.action == 'create'} }    
            steps{

                script{
                   staticCodeAnalysis() 
                }
            }
        }





    }












}