pipeline {
    agent any
    parameters {
        choice(name: 'Environment', choices:['dev','prod'])
    }
    stages {
        stage('Exporting aws credentials') {
            steps {
                echo "Exporting aws credentials"
                withCredentials([usernamePassword(credentialsId: 'aws-credentials', usernameVariable: 'ACCESSKEY', passwordVariable: 'SECRETKEY')]) {
                    sh "export AWS_ACCESS_KEY_ID=$ACCESSKEY"
                    sh "export AWS_SECRET_ACCESS_KEY=$SECRETKEY"
                }
            }
        }
 
        stage('Preparing all environments') {
            steps {
                echo "Preparing all environments"
                sh ('terraform init')
                sh ('terraform workspace new dev')
                sh ('terraform workspace new prod')
            }
        }

        stage('Deploying in dev environment') {
            when {
                expression{
                    params.project==dev
                }
            }
            steps {
                echo "Deploying in dev environment"
                sh ('terraform workspace select dev')
                sh ('terraform apply --var-file dev.tfvars --auto-approve')
            }
        }

        stage('Deploying in prod environment') {
            when {
                expression{
                    params.project==prod
                }
            }
            steps {
                echo "Deploying in prod environment"
                sh ('terraform workspace select prod')
                sh ('terraform apply --var-file prod.tfvars --auto-approve')
            }
        }
        
    }
}
