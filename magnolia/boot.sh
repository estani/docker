#!/bin/bash
MAGNOLIA_APACHE_HOME=/opt/magnolia-5.3/apache-tomcat-7.0.47

if [[ "$1" != stop ]]; then
    $MAGNOLIA_APACHE_HOME/bin/magnolia_control.sh start && tail -f $MAGNOLIA_APACHE_HOME/logs/catalina.out
fi

$MAGNOLIA_APACHE_HOME/bin/magnolia_control.sh stop 
