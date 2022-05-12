pipeline {
  agent any
  
  environment {
      DOCKERHUB_CREDENTIALS = credentials ('testhubviktor-dockerhub')
  }
  stages {
    
    stage('GIT Checkout') {
        steps {
            git branch: 'main', url: 'https://github.com/ViktorMarhitich/home_task.git'
        }
    }

    
    
    stage('Building Image') {
      steps{
        bat 'docker build -f ./Dockerfile -t testhubviktor/home_task .'
      }
    }
    
    stage('Login to dockerhub') {
        steps {
           //bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
          bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u testhubviktor --password-stdin'
        }
    }
    
    stage('Push') {
        steps {
            bat 'docker push testhubviktor/home_task:latest'
        }
    }
  }
  
  post {
        always {
            bat 'docker logout'
        }
    }
}
