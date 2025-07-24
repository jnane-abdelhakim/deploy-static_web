properties([
  pipelineTriggers([
    pollSCM('H/5 * * * *')  
  ])
])

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/jnane-abdelhakim/deploy-static_web.git', credentialsId: 'key07'
            }
        }

        stage('Deploy with Ansible') {
            steps {
                
                sh 'ansible-playbook deploy.yml -i localhost, --connection=local'
            }
        }

        stage('Test Deployment') {
            steps {
                script {
                    def status = sh(script: "curl -o /dev/null -s -w '%{http_code}' http://localhost", returnStdout: true).trim()
                    if (status != '200') {
                        error("erreur, code HTTP: ${status}")
                    } else {
                        echo "success (HTTP 200)."
                    }
                }
            }
        }
    }
}
