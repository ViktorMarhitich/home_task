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
        sh 'docker build -f ./Dockerfile -t testhubviktor/home_task .'
      }
    }
    
    stage('Login to dockerhub') {
        steps {
           sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
          //bat 'docker login -u testhubviktor -p $DOCKERHUB_CREDENTIALS_PSW'
        }
    }
    
    stage('Push') {
        steps {
            sh 'docker push testhubviktor/home_task:latest'
        }
    }
  }
  
  post {
        always {
            sh 'docker logout'
        }
    }
}
