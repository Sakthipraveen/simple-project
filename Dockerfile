FROM tomcat
WORKDIR webapps
COPY target/my-app-1.0-SNAPSHOT.jar .
RUN rm -rf ROOT && mv my-app-1.0-SNAPSHOT.jar ROOT.war
EXPOSE 8090
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
