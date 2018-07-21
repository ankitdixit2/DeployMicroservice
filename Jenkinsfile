def notifySlack(String buildStatus = 'STARTED') {
    // Build status of null means success.
    buildStatus = buildStatus ?: 'SUCCESS'
    
    def msg = "${buildStatus}: `${env.JOB_NAME}` #${env.BUILD_NUMBER}:-Microservice image has been created and pushed to Docker registry by ankit.dixit"

    slackSend(message: msg)
}
node {
    checkout scm
    try {
    stage('build') {
        /* Test docker  compose  */
      //      sh "docker-compose build"
      //      sh "docker tag mysqlnodejsmicroservice_db ankurdixit82/mysqlnodejsmicroservice_db:latest"
     //       sh "docker tag mysqlnodejsmicroservice_users-service ankurdixit82/mysqlnodejsmicroservice_users-service:latest"
         //    sh "docker login -u ****** -p *****"     
             sh "docker build -t users_service ./users-service"
             sh "docker build -t eiadatabase ./eiadatabase"
             sh "docker tag users_service:latest eiaconsulting/docker_users-service"
             sh "docker tag eiadatabase:latest eiaconsulting/docker_db"
             sh "docker push eiaconsulting/docker_users-service"
             sh "docker push eiaconsulting/docker_db"                                     
    }
        currentBuild.result = "SUCCESS"
        notifySlack(currentBuild.result)
       
  } catch (e) {
    // If there was an exception thrown, the build failed
    currentBuild.result = "FAILED"
    //throw e
    notifySlack(currentBuild.result)
  }    
}
