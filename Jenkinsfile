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
            sh "docker-compose build"
      //      sh "docker tag mysqlnodejsmicroservice_db ankurdixit82/mysqlnodejsmicroservice_db:latest"
     //       sh "docker tag mysqlnodejsmicroservice_users-service ankurdixit82/mysqlnodejsmicroservice_users-service:latest"
            docker build -t users_service .
             sh "docker build -t eiadatabase .
             sh "docker tag users_service:latest eiaconsulting/users_service
             sh "docker tag eiadatabase:latest eiaconsulting/eiadatabase
             sh "docker push eiaconsulting/users_service"
             sh "docker push eiaconsulting/eiadatabase
             sh "docker build eiaconsulting/docker_db:latest"
                         
    }
     try {
      
        notifySlack(currentBuild.result)

        // Existing build steps.
    } catch (e) {
        currentBuild.result = 'FAILURE'
        throw e
    }
}
