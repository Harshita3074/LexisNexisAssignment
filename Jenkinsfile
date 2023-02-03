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
            steps{
                echo 'running terraform apply to provision infrastructure'
                //sh 'terraform apply --auto-approve'
            }
        }
    }
}