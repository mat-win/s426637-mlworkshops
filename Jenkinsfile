pipeline {
   agent { dockerfile true }

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
	 stage('CopyArtifacts')
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
      		archiveArtifacts 'lwierszy.txt'
      		archiveArtifacts 'wynik.txt'
      		archiveArtifacts 'score'
      		archiveArtifacts 'hypothesis.txt'
      		archiveArtifacts 'reference.txt'
     		archiveArtifacts 'hypothesis.trn'
      		archiveArtifacts 'reference.trn'  
      		archiveArtifacts 'wer_all.txt'
      		archiveArtifacts 'wer.txt'
      		archiveArtifacts 'srr.txt'
      		archiveArtifacts 'wikinews_results.tsv'
      	}
      }
  stage('Build plots') 
     {
         steps {
            build 's426637-plots'
         }
      }
   }
}
