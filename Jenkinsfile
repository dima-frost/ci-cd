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
                echo "start building"
                dir('Dockerfile dir'){
                 sh 'sudo docker build .'
                }
            }
        }
    }
}