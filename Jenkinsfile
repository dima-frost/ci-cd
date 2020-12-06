#!groovy
pipeline {
    agent{
        label 'master'
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'10', artifactNumToKeepStr: '10'))
        timestamp()
    }
    stages{
        stage("First stap") {
            steps{
                sh 'echo \'i am working!!!!!\''
            }
        }
    }
}