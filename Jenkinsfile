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
            sh 'docker tag ryudwig/jpa gcr.io/gcrtest2/jpa'
        }
    }

    stage('Push Image to GCR') {
         steps {
             withDockerRegistry([credentialsId: 'gcr:gcrtest2', url: 'https://gcr.io']){
                sh "docker push gcr.io/gcrtest2/jpa:latest"
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