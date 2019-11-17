#!/usr/bin/env groovy
// Liquibase declarative pipeline
//
//
pipeline {
agent {
    node {
      label 'master'
      //customWorkspace "/Users/support.liquibase.net/workspace/1.Package-${BUILD_NUMBER}/"
    }
  }
  environment {
    PROJ="CLO"
  	GITURL="https://github.com/szandany"
    //JAVA_HOME=$(/usr/libexec/java_home)
    //PATH=/Users/support.liquibase.net/liquibase-3.8.1-bin:$PATH
    LIQUIBASE_PIPELINE="${params.pipeline}"
  	ENVIRONMENT="${params.environment}"
    //PATH="$PATH:/opt/datical/DaticalDB/repl:$ORACLE_HOME/bin"
  }
  stages {

    stage ('Precheck') {
		steps {
			sh '''
        export PATH=/Users/support.liquibase.net/liquibase-3.8.1-bin:$PATH
        export JAVA_HOME=$(/usr/libexec/java_home)
				echo PATH=${PATH}
				whoami
				which git
				git --version
			'''
		} // steps
	} // stage 'precheck'

    stage ('Checkout') {
      steps {
        // checkout Liquibase project from CLO repo
        sh '''
          #{ set +x; } 2>/dev/null
          cd /Users/support.liquibase.net/workspace
          if [ -d "CLO" ]; then rm -Rf CLO; fi
          git clone https://github.com/szandany/${PROJ}.git
          '''
      } // steps for checkout stages
    } // stage 'checkout'

   stage ('Environment'){
      steps {
        sh '''
          #{ set +x; } 2>/dev/null
          cd /Users/support.liquibase.net/workspace/${PROJ}/QA
          echo "Current Directory:" `pwd`
          git status
        '''
      } // steps
    }   // Environment stage

    stage('liquibase commands') {
      steps {
					sh '''
					  #{ set +x; } 2>/dev/null
            cd /Users/support.liquibase.net/workspace/${PROJ}/QA
            liquibase --version
            echo "------------------------------------"
            echo "----------liquibase status----------"
            echo "------------------------------------"
            liquibase status
            echo "---------------------------------------------"
            echo "----------liquibase rollbackCount=2----------"
            echo "---------------------------------------------"
            liquibase rollbackCount 2
            echo "---------------------------------------"
            echo "----------liquibase updateSQL----------"
            echo "---------------------------------------"
            liquibase updateSQL
            echo "------------------------------------"
            echo "----------liquibase update----------"
            echo "------------------------------------"
            liquibase update
					  //hammer groovy deployPackager.groovy pipeline=${LIQUIBASE_PIPELINE} scm=true labels="${BUILD_NUMBER}"
					  '''
				} // steps
	  		} //liquibase commands

        stage ('Deleting project workspace'){
           steps {
             sh '''
               #{ set +x; } 2>/dev/null
               echo "Deleting project workspace..."
               cd /Users/support.liquibase.net/workspace && rm -r ${PROJ}
             '''
           } // steps
         }   // Deleting project workspace
  } // stages
}  // pipeline
