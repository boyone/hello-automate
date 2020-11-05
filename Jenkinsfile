pipeline {
    agent any

    stages {
        stage('unit test & report') {
            steps {
                sh label: 'go test', script: '''cd helloworld
go mod download
go test -v 2>&1 | go-junit-report > report.xml'''
            }
            post {
                always {
                    junit 'helloworld/report.xml'
                }
            }
        }
        stage('build and start application') {
            steps {
                sh label: 'docker-compose up', script: 'docker-compose up -d --build --force-recreate'
            }
        }
        stage('run api test') {
            steps {
                sh label: 'robot', script: '''cd test/api
                source env/bin/activate
                robot greeting.robot
                deactivate'''
            }
            post {
                always {
                    sh label: 'docker-compose down', script: 'docker-compose down'
                }
            }
        }
    }
}