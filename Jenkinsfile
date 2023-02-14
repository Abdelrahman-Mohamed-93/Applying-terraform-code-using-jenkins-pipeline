pipeline {
    agent any
    parameters {
        choice(name: 'Environment', choices:['dev','prod'])
    }
    stages {
        stage('Preparing all environments') {
            steps {
                echo "Preparing all environments"
                withAWS(credentials: 'aws-credential') {
                    sh ('terraform init')
                    sh ('terraform workspace new dev || true')
                    sh ('terraform workspace new prod || true')
                }
            }
        }

        stage('Deploying in dev environment') {
            when {
                expression{
                    params.Environment == 'dev'
                }
            }
            steps {
                echo "Deploying in dev environment"
                withAWS(credentials: 'aws-credential') {
                    sh ('terraform workspace select dev')
                    sh ('terraform apply --var-file dev.tfvars --auto-approve')
                }
            }
        }

        stage('Deploying in prod environment') {
            when {
                expression{
                    params.Environment == 'prod'
                }
            }
            steps {
                echo "Deploying in prod environment"
                withAWS(credentials: 'aws-credential') {
                    sh ('terraform workspace select prod')
                    sh ('terraform apply --var-file prod.tfvars --auto-approve')
                }
            }
        }
        
    }
}
