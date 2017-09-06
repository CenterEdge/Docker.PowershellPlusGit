node('docker && git') {
    def app

    stage('Clone repository') {
		properties([pipelineTriggers([[$class: 'GitHubPushTrigger'], pollSCM('H/15 * * * *')])])
        
        checkout scm
    }
	
    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("centeredge/powershell.git")
    }

    stage('Push image') {
		/* Finally, we'll push the image with two tags:
		 * First, the incremental build number from Jenkins
		 * Second, the 'latest' tag.
		 * Pushing multiple tags is cheap, as all the layers are reused. */
		docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
			app.push("${env.BUILD_NUMBER}")
			app.push("latest")
		}
    }
}