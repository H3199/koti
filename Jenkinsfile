pipeline {
    agent any

    environment {
        MUMBLE_PASSWORD = credentials('MUMBLE_PASSWORD')
    }

    stages {
        stage('Deploy') {
            steps {
                sh '''
                chmod +x ./murmur/run.sh
                ./murmur/run.sh
                '''
            }
        }
    }
}
