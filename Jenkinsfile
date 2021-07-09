currentBuild.displayName = "Devops # "+currentBuild.number

pipeline {
    agent any
    tools{
      maven 'Maven3'
    }
    stages {

        stage('build && SonarQube analysis') {
            steps {
              script{
                withSonarQubeEnv('sonar') {
                  sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar'

                }
              }
                sh 'mvn clean install package'
            }
        }
        stage("Quality Gate") {
            steps {
              script{
                timeout(time: 1, unit: 'MINUTES') {
                  def qg = waitForQualityGate()
                  if (qg.status != 'OK') {
                    error "Pipeline aborted due to quality gate failure: ${qg.status}"
                  }
                }
              }
            }
        }
    }
}
