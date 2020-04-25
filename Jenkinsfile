pipeline {
  agent none
  stages {
    stage('Buld & Test') {
      steps {
        sh 'mvn -Dmaven.test.failure.ignore clean package'
      }
    }

  }
}