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
    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
        success {
            echo 'I succeeded!'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Things were different before...'
        }
    }
}