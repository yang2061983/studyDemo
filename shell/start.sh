#!/bin/sh
source /etc/profile
JAVA_OPTS=' -Xms512m -Xmx512m -XX:PermSize=128m -XX:MaxPermSize=128m '
#nohup java -jar $JAVA_OPTS $JAVA_JMX fintech-media.jar --spring.config.location=file:./application.properties  > /dev/null 2>&1 &
nohup java -jar $JAVA_OPTS $JAVA_JMX /home/jyapp/fintech-media/fintech-media.jar   >> nohup.out 2>&1 &

echo $! > java.pid
