def notifySlack(String buildStatus = 'STARTED') {
    // Build status of null means success.
    buildStatus = buildStatus ?: 'SUCCESS'
    
    def msg = "${buildStatus}: `${env.JOB_NAME}` #${env.BUILD_NUMBER}:-Microservice image pushed to Docker registry by shrilekha.s"

    slackSend(message: msg)
}
node {
    checkout scm
    stage('build') {
        /* Test docker  compose  */
      //      sh "docker-compose build"
      //      sh "docker tag mysqlnodejsmicroservice_db ankurdixit82/mysqlnodejsmicroservice_db:latest"
     //       sh "docker tag mysqlnodejsmicroservice_users-service ankurdixit82/mysqlnodejsmicroservice_users-service:latest"
             sh "docker build -t users_service ./users-service"
             sh "docker build -t eiadatabase ./eiadatabase"
             sh "docker tag users_service:latest eiaconsulting/docker_users-service"
             sh "docker tag eiadatabase:latest eiaconsulting/docker_db"
             sh "docker push eiaconsulting/docker_users-service"
             sh "docker push eiaconsulting/docker_db"
                                     
    }
     try {
      
        notifySlack(currentBuild.result)

        // Existing build steps.
    } catch (e) {
        currentBuild.result = 'FAILURE'
        throw e
    }
}
