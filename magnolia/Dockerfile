#inspired by: https://registry.hub.docker.com/u/nicolasbarbe/magnolia-base/dockerfile/
FROM java

ENV DEBIAN_FRONTEND noninteractive

ENV MAGNOLIA_URL https://nexus.magnolia-cms.com/content/repositories/magnolia.public.releases/info/magnolia/bundle/magnolia-tomcat-bundle/5.3/magnolia-tomcat-bundle-5.3-tomcat-bundle.tar.gz

#Install magnolia
RUN cd /opt && curl $MAGNOLIA_URL | tar xz

COPY boot.sh /boot.sh
COPY install.sh /install.sh
#Set it up for the first time
RUN /install.sh & \
    rm install.sh
 
## Configure Apache Tomcat environment variables
#ENV CATALINA_HOME /usr/share/tomcat7
#ENV CATALINA_BASE /var/lib/tomcat7
#ENV CATALINA_TMPDIR /tmp/tomcat7

#ENV POSTGRESQL_JDBC_PACKAGE postgresql-9.3-1102.jdbc41

# Make sure that the temporary directory exists
#RUN mkdir -p $CATALINA_TMPDIR              

# Remove all webapps from the default Tomcat installation
#RUN rm -rf $CATALINA_BASE/webapps/*

# Copy tomcat configuration files from the project to the container
#COPY tomcat/setenv.sh  $CATALINA_BASE/bin/setenv.sh

# Install JDBC drivers
#RUN mkdir $CATALINA_HOME/lib/jdbc
#RUN wget -nv http://jdbc.postgresql.org/download/$POSTGRESQL_JDBC_PACKAGE.jar -O $CATALINA_HOME/lib/$POSTGRESQL_JDBC_PACKAGE.jar

# Start the tomcat instance
#ENTRYPOINT ["/usr/share/tomcat7/bin/catalina.sh", "run"]
#CMD [""]

# Expose the ports
EXPOSE 8080
