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
        docker rm -f wordpress
        sleep 20 
        docker run --name wordpress  --network=wordpress_n/w  -d -v "$PWD/":/var/www/html -p 80:80 
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
