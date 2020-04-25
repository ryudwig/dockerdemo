pipeline {
  agent none
  stages {
    stage('Buld & Test') {
      steps {
        sh 'mvn -Dmaven.test.failure.ignore clean package'
        stash(name: 'build-test-articacts', includes: '**/target/surefire-reports')
      }
    }

  }
}