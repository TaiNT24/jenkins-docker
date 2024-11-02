#!/bin/sh

# service docker start
# timeout 30s bash -c 'until sudo docker info >/dev/null 2>&1; do echo "Waiting for Docker to start..."; sleep 1; done'
# exec jenkins-agent "$@"

java -jar /usr/share/jenkins/agent.jar -url "$JENKINS_URL" -secret "$SECRET" -name "$SLAVE_NAME" -webSocket
