pipeline {
  environment {
    registry = "frehman/pipe1"
    registryCredential = 'hub'
  }
agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'git@github.com:faisikhan/sharksnode.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
