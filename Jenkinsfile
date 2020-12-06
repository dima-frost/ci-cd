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
        node {
           try {
            notifyStarted()

            /* ... existing build steps ... */

            notifySuccessful()
          } catch (e) {
            currentBuild.result = "FAILED"
            notifyFailed()
            throw e
          }
        }
    }
}