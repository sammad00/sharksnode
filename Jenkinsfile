pipeline {
  environment {
    registry = "frehman/pipe1"
    registryCredential = 'hub'
  }
agent any
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
