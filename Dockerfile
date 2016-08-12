FROM fabric8/java-jboss-openjdk8-jdk

MAINTAINER eformat@gmail.com

RUN mkdir -p /opt/jboss/picapport && mkdir -p /opt/jboss/picapport/data && mkdir -p /opt/jboss/picapport/photos && chmod -R 777 /opt/jboss/picapport

ADD picapport.properties /opt/jboss/picapport/
ADD picapport.sh /opt/jboss/picapport/
# http://picapport.de/download/picapport-headless_v6.1.00.jar
ADD picapport-headless_v6.1.00.jar /opt/jboss/picapport/

VOLUME /opt/jboss/picapport/data
VOLUME /opt/jboss/picapport/photos

EXPOSE 8080

WORKDIR "/opt/jboss/picapport/"

ENTRYPOINT ["./picapport.sh"]

# docker build -t piccaport .
# docker run --rm -p 8080:8080 piccaport
# docker run --entrypoint bash -it --rm -p 8080:8080 piccaport
