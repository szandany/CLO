#!/usr/bin/env groovy
// Liquibase declarative pipeline
//
//
pipeline {
agent any
  environment {
    PROJ="CLO"
  	GITURL="https://github.com/szandany"
    //JAVA_HOME=$(/usr/libexec/java_home)
    //PATH=/Users/support.liquibase.net/liquibase-3.8.1-bin:$PATH
  	ENVIRONMENT_STEP="${params.step}"
    BRANCH="${params.pipeline}"
    //PATH="$PATH:/opt/datical/DaticalDB/repl:$ORACLE_HOME/bin"
  }
  stages {

    stage ('Precheck') {
		steps {
			sh '''
        { set +x; } 2>/dev/null
        echo "Current scm branch: "$BRANCH
        echo "Current environment: "$ENVIRONMENT_STEP
        export PATH=/Users/support.liquibase.net/liquibase-3.8.1-bin:$PATH
        export JAVA_HOME=$(/usr/libexec/java_home)
			'''
		} // steps
	} // stage 'precheck'

    stage ('Checkout') {
      steps {
        // checkout Liquibase project from CLO repo
        sh '''
          { set +x; } 2>/dev/null
          cd /Users/support.liquibase.net/workspace
          if [ -d "CLO" ]; then rm -Rf CLO; fi
          git clone https://github.com/szandany/${PROJ}.git
          cd ${PROJ}
          git checkout $BRANCH
          git status
          '''
      } // steps for checkout stages
    } // stage 'checkout'

   stage ('liquibase commands'){
      steps {
        sh '''
          { set +x; } 2>/dev/null
          export PATH=/Users/support.liquibase.net/liquibase-3.8.1-bin:$PATH
          cd /Users/support.liquibase.net/workspace/${PROJ}/${ENVIRONMENT_STEP}
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
        '''
      } // steps
    }   // Environment stage

        stage ('Deleting project workspace'){
           steps {
             sh '''
               { set +x; } 2>/dev/null
               echo "Deleting project workspace..."
               cd /Users/support.liquibase.net/workspace && rm -r ${PROJ}
             '''
           } // steps
         }   // Deleting project workspace
  } // stages
}  // pipeline
