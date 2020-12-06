#!groovy
pipeline {
    agent{
        label 'master'
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'10', artifactNumToKeepStr: '10'))
        timestamps()
    }
    stages{
        stage("create docker image") {
            steps {
                dir('Dockerfile dir'){
                 sh 'docker-compose build'
                }
            }
         }
        stage("docker run"){
            dir('Dockerfile dir'){
                 sh 'docker-compose run'
                }
        }
    }
}