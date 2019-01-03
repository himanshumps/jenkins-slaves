#!/bin/bash

echo "Running Jenkins JNLP Slave...."
JAR=`ls -1 /opt/jenkins-slave/bin/slave.jar | tail -n 1`
echo "java -jar slave.jar -headless -jar-cache $HOME -tunnel ${JENKINS_SERVICE_NAME}:${JENKINS_SERVICE_PORT} -url ${JENKINS_URL} {SECRET_KEY} {SLAVE_NAME}"
exec java -jar $JAR -headless -jar-cache $HOME -tunnel ${JENKINS_SERVICE_NAME}:${JENKINS_SERVICE_PORT} -url ${JENKINS_URL} {SECRET_KEY} {SLAVE_NAME}
