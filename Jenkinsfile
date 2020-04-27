pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
      args '-v /root/.m2:/root/.m2'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'mvn package sonar:sonar'
      }
    }

    stage('Quality Analysis') {
      steps {
        waitForQualityGate(abortPipeline: true, credentialsId: 'sonarqube-token', webhookSecretId: 'ryu_Jenkins')
      }
    }

  }
}