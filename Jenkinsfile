pipeline {
  environment {
    imagename = "wp"
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/vishal267/wp-docker.git', branch: 'master', credentialsId: 'vishal-github-user-token'])

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Run Container') {
      steps{
        script {
               sh '''
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'mycreds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
        sed -i s/encrypted_password/$PASSWORD/ wp-config.php
        docker rm -f wordpress
        sleep 20 
        docker run --name wordpress  --network=wordpress_n/w  -d -v "$PWD/":/var/www/html -p 80:80 wp:latest
        '''

          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    }
  }
}
