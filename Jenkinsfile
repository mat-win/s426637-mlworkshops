pipeline {
   agent any

   stages {
      stage('Hello') {
         steps {
            echo 'Hello World'
         }
      }
	stage('Checkout')
	{
	steps{
		checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/mat-win/s426637-mlworkshops.git']]])
	}
	}
	stage('Copy Artifacts')
	{
	steps{
		copyArtifacts filter: 'wikinews_results.txt', fingerprintArtifacts: true, projectName: 'ASR-eval', selector: lastSuccessful()
	}
	}
   }
}
