@Library('shared-library') _

pipeline{

    agent any

    stages{
        
        stage('Git checkout'){
            
            steps{

                script{
                    gitCheckout(
                        branch: "main"
                        url: 'https://github.com/vigi06/full-devops-project.git'
                    )
                }
            }
        }






    }












}