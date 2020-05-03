pipeline {
  agent any
  tools {
    maven 'maven'
  }
  stages {
    stage('Build') {
      steps {
        sh 'mvn package'
      }
    }

    stage('Quality Analysis') {
        steps {
            withSonarQubeEnv('SonarQubeScanner'){
                sh 'mvn sonar:sonar'
            }
        }
    }

    stage('Quality Gate') {
      steps {
        timeout(time: 1, unit: 'HOURS'){
            waitForQualityGate(abortPipeline: true, credentialsId: 'sonarqube-token', webhookSecretId: 'ryu_Jenkins')
        }
      }
    }

  }
  environment {
    tools = 'maven \'mvn-3.63\''
  }
}