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
            def qgRes = waitForQualityGate(abortPipeline: true, credentialsId: 'sonarqube-token', webhookSecretId: 'ryu_Jenkins')
            if(qgRes.status != 'OK'){
                error "Pipeline aborted due to quality gate failure: ${qgRes.status}"
            }
        }
      }
    }

  }
  environment {
    tools = 'maven \'mvn-3.63\''
  }
}