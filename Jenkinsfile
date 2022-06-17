pipeline {
  environment {
    imagename = "frehman/pipe1"
    registryCredential = 'hub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Clone Git') {
      steps {
        git([url: 'git@github.com:faisikhan/sharksnode.git', credentialsId: 'githubcreds', branch: 'main'])

      }
    }
    stage('Build Image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Push Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             }
        }
      }
    }
    stage('Pull Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.pull("$BUILD_NUMBER")
             }
        }
      }
    }
    
     stage('Deploy Image') {
      steps{
        sh "docker run -p 8066:8066 --name jenkinsweb $imagename:$BUILD_NUMBER"
        }
      }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"
        } 
      }
    }
  }
