pipeline {
  agent {
    docker {
      image 'maven:3-alpine'
      args '-v /root/.m2:/root/.m2'
    }

  }
  stages {
    stage('Buld & Test') {
      steps {
        sh 'mvn clean package'
        stash(name: 'build-test-articacts', includes: '**/target/surefire-reports/TEST-*.xml,target/*.jar')
      }
    }

  }
}