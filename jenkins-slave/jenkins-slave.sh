#!/bin/bash

master_username=${JENKINS_USERNAME:-"admin"}
master_password=${JENKINS_PASSWORD:-"password"}
slave_executors=${EXECUTORS:-"1"}
echo "Running Jenkins JNLP Slave...."
JAR=`ls -1 /opt/jenkins-slave/bin/slave.jar | tail -n 1`
TUNNEL="-tunnel ${JENKINS_TUNNEL}"
URL="-url ${JENKINS_URL}"
echo "java $JAVA_OPTS -cp $JAR hudson.remoting.jnlp.Main -headless $TUNNEL $URL -jar-cache $HOME"
exec java $JAVA_OPTS -cp $JAR hudson.remoting.jnlp.Main -headless $TUNNEL $URL -jar-cache $HOME "$@"
