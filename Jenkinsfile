pipeline {
  agent none
  stages {
    stage('Buld & Test') {
      steps {
        sh 'mvnw clean package'
        stash(name: 'build-test-articacts', includes: '**/target/surefire-reports/TEST-*.xml,target/*.jar')
      }
    }

  }
}