pipeline {
    agent any
    tools{
      maven 'Maven3'
    }
    stages {

        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                  script{
                    sh 'mvn sonar:sonar'
                  }
                }
                sh "mvn clean install"
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
