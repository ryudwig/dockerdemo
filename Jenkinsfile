pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
      args '-v /root/.m2:/root/.m2'
    }

  }
  stages {
    stage('Buld & SonarQube analysis') {
      steps {
        withSonarQubeEnv(installationName: 'widerplanet SonarQube', credentialsId: 'sonarqube-token') {
          sh 'mvn clean package sonar:sonar'
        }

      }
    }

    stage('Quality Gate') {
      steps {
        timeout(time: 1, unit: 'HOURS') {
          waitForQualityGate(abortPipeline: true, credentialsId: 'sonarqube-token')
        }

      }
    }

  }
}