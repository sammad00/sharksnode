pipeline {
    environment {
    imagename = "frehman/pipe1"
    registryCredential = 'hub'
    dockerImage = ''
  } 
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'docker build . -t frehman/pipe1'
                }
        }
    }
}
