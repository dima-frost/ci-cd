#!groovy
pipeline {
    agent{
        label 'master'
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'10', artifactNumToKeepStr: '10'))
        timestamps()
    }
    environment {
        NAME="DIMA"
        AGE = '28'
    }
    stages {
        stage ("create docker image") {
            steps {
                dir('Dockerfile dir') {
                 sh 'docker-compose build'
                }
            }
         }
        stage ('docker run') {
            steps {
                dir('Dockerfile dir') {
                 sh 'docker-compose up -d'
                }
            }
        }
    }
   node {
        notifySuccessful()
        def notifySuccessful() {
              emailext (
                  subject: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                  body: """<p>SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
                    <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
                  recipientProviders: [[$class: 'DevelopersRecipientProvider']]
                )
        }
   }
}