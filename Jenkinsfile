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
            withSonarQubeEnv('SonarQube'){
                sh 'mvn sonar:sonar'
            }
        }
    }

    stage('Quality Gate') {
      steps {
        timeout(time: 1, unit: 'HOURS'){
            QG_RES = waitForQualityGate(abortPipeline: true, credentialsId: 'sonarqube-token', webhookSecretId: 'ryu_Jenkins')
            if(QG_RES.status != 'OK'){
                error "Pipeline aborted due to quality gate failure: ${QG_RES.status}"
            }
        }
      }
    }

  }
  environment {
    tools = 'maven \'mvn-3.63\''
  }
}