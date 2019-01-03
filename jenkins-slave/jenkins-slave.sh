#!/bin/bash

echo "Running Jenkins JNLP Slave...."
JAR=`ls -1 /opt/jenkins-slave/bin/slave.jar | tail -n 1`
# Get the JNLP file
curl -o $HOME/agentJnlpFile.jnlp ${JNLP_URL}
# Do the replacement
echo "File before replacement"
cat $HOME/agentJnlpFile.jnlp
sed -i "s/${JENKINS_ROUTE_URL}/${JENKINS_SERVICE_URL}/g" $HOME/agentJnlpFile.jnlp
echo "File after replacement"
cat $HOME/agentJnlpFile.jnlp
echo "java -jar $JAR -jnlpUrl \"file:$HOME/agentJnlpFile.jnlp\""
exec java -jar $JAR -jnlpUrl "file:$HOME/agentJnlpFile.jnlp"
