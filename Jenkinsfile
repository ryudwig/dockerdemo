pipeline {
  agent any
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
  environment {
    tools = 'maven \'mvn-3.63\''
  }
}