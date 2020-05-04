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

    stage('Build Docker Image') {
        steps {
            sh 'mvn install dockerfile:build'
        }
    }

    stage('Push Image to GCR') {
         steps {
             withDockerRegistry([credentialsId: 'gcrtest2', url: 'https://gcr.io']){
                sh "docker push ryudwig/jpa:latest"
             //sh "docker push ${env.DOCKER_REPO}/${env.DOCKER_IMAGE}:${env.BUILD_NUMBER}"
             }
         }
    }



    stage('Quality Analysis') {
        steps {
            withSonarQubeEnv('widerplanet SonarQube'){
                sh 'mvn sonar:sonar'
            }
        }
    }

    stage('Quality Gate') {
      steps {
        timeout(time: 5, unit: 'MINUTES'){
            waitForQualityGate(abortPipeline: true, credentialsId: 'sonarqube-token', webhookSecretId: 'ryu_Jenkins')
        }
      }
    }

  }
  environment {
    tools = 'maven \'mvn-3.63\''
  }
}