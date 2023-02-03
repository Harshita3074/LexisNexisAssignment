pipeline {
    agent any
    stages{
        stage('checkout'){
            steps{
                checkout scm
            }
        }
        stage('initialize'){
            steps{
                echo 'initializizng terraform'
                sh 'terraform init'
            }
        }
        stage('plan'){
            steps{
                echo 'running terraform plan to verify'
                sh 'terraform plan'
            }
        }
        stage('apply'){
            input{
                message "Do you want to proceed for infra deployment?"
            }
            steps{
                echo 'running terraform apply to provision infrastructure'
                sh 'terraform apply --auto-approve'
            }
        }
        stage('destroy'){
            input{
                message "Do you want to proceed for infra destruction?"
            }
            steps{
                echo 'running terraform destroy to delete infrastructure'
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}