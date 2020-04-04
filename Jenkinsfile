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
	 stage('CopyArtificats')
      {
      	steps{
      		copyArtifacts filter: 'wikiniews_results.tsv', fingerprintArtifacts: true, projectName: 'ASR-eval', selector: lastSuccessful()
      	}
      }
      stage('Count metrics')
      {
      	steps{
      		sh label: 'ls', script: 'ls -l'
      		sh label: 'metrics', script: './scrypt.sh'
      		
      	}
      }
      stage('Archive metrics')
      {
      	steps{
      		archiveArtifacts 'wynik.txt'
      	}
      }
   }
}
