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
            steps{
                sh 'sudo docker build -t nginx:1.0 .'
            }
        }
    }
}