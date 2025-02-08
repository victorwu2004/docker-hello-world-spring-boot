# Maven build container 
FROM maven:3.8.5-openjdk-11 AS maven_build
RUN mvn package
VOLUME /tmp
ARG JAR_FILE
ADD target/hello-world-0.1.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
