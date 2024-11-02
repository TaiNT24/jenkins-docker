#!/bin/sh
echo "-jar /usr/share/jenkins/agent.jar -url $JENKINS_URL -secret $SECRET -name $SLAVE_NAME -webSocket"
java -jar /usr/share/jenkins/agent.jar -url "$JENKINS_URL" -secret "$SECRET" -name "$SLAVE_NAME" -webSocket