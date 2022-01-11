def getEnvFromBranch(branch) {
  if (branch == 'develop') {
    return 'dev'
  }else if (branch == 'test') {
    return 'test'
  } else {
    return 'sit'
  }
}
pipeline {
  agent { label 'master' }
  environment {
    ENV = getEnvFromBranch(env.BRANCH_NAME)
    ANYPOINT = credentials('ANYPOINT')
  }
  stages {
    stage ('Build') {
      steps {
           //enable remote triggers
        script {
          properties([pipelineTriggers([pollSCM('*/5 * * * *')])])
        }
        withMaven(maven:'maven') {
          sh 'mvn clean install -P default'
        }
      }
    }
    stage ('Deploy') {
      steps {
        withMaven(maven:'maven') {
          sh 'mvn -f pom.xml package deploy -DskipTests -P $BRANCH_NAME -X -Ddeploy.username=$ANYPOINT_USR -Ddeploy.password=$ANYPOINT_PSW -DmuleDeploy'
        }
      }
    }
  }
}
