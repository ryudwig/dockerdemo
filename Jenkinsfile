pipeline {
  agent any
  stages {
    stage('Buld & Test') {
      steps {
        sh 'mvn clean package'
        stash(name: 'build-test-articacts', includes: '**/target/surefire-reports/TEST-*.xml,target/*.jar')
      }
    }

  }
}