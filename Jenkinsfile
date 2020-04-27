pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
      args '-v /root/.m2:/root/.m2'
    }

  }
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh 'mvn clean package sonar:sonar'
          }
        }

        stage('Quality Gate') {
          steps {
            waitForQualityGate(abortPipeline: true, credentialsId: 'aaa', webhookSecretId: 'bbb')
          }
        }

      }
    }

  }
}