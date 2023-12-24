pipeline {
	agent any
	
    environment {
        registry = "securewolf/talentx_app"
        registryCredential = 'talentxDHub'
    }
    
    stages{
        
	   stage('Build'){
            steps {
                sh 'mvn clean install -DskipTests'
            }
            post {
                success {
                    echo "Now Archiving."
                    archiveArtifacts artifacts: '**/*war'
                }
            }
        }

	   stage('Unit Test'){
            steps {
                sh 'mvn test'
            }
        }


        stage('Checkstyle Analysis'){
            steps {
                sh 'mvn checkstyle:checkstyle'
            }
        }

        stage('Code Analysis with SONARQUBE') {
          
          environment {
             scannerHome = tool 'sonar4.7'
          }

          steps {
            withSonarQubeEnv('sonar') {
               sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=talentx \
                   -Dsonar.projectName=talentx \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/test-classes/com/talentx/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
                }
            timeout(time: 10, unit: 'MINUTES') {
               waitForQualityGate abortPipeline: true
            }

          }    
        }

        stage('Build Talentx App Image'){
          steps{
            script {
                dockerImage = docker.build registry + ":V$BUILD_NUMBER"    
            }
          }
        }

        stage('Upload Image to Dockerhub'){
          steps{
            script {
                docker.withRegistry('', registryCredential) {
                  dockerImage.push("V$BUILD_NUMBER")
                  dockerImage.push('latest')
                }
            }
          }
        }

        stage('Remove Old App Image'){
          steps{
            sh "docker rmi $registry:V$BUILD_NUMBER"                  }
          }
        }

        stage('App Deployment on K8s') {
          agent {label 'KOPS'}
            steps {
              sh "helm upgrade --install --force talentx-stack helm/talentxcharts --set appimage=${registry}:V${BUILD_NUMBER} --namespace prod"
            }
        }
    }   
}		