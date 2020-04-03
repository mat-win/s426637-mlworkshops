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
		copyArtifacts filter: 'wikiniews_results.tsv', fingerprintArtifacts: true, projectName: 'ASR-eval', selector: lastSuccessful()
	}
	}
	stage('script')
	{
	steps{
		sh label: '', script: 'scrypt.sh'
	}
	}
   }
}
