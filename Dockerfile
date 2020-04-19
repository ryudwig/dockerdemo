#FROM openjdk:8-jdk-alpine
#LABEL maintainer="ludwig.ryu@gmail.com"

#ADD target/jpa-0.0.1-SNAPSHOT.jar dockerdemocontainer.jar

#EXPOSE 8088

#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /dockerdemocontainer.jar" ]
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/dockerdemocontainer.jar"]


# Start with a base image containing Java runtime
FROM java:8

# Add Author info
LABEL maintainer="ludwig.ryu@gmail.com"

# Add a volume to /tmp
WORKDIR /opt/app
# Make port 8080 available to the world outside this container
EXPOSE 8088

# The application's jar file
ARG JAR_FILE=jpa-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
COPY ${JAR_FILE} /democontainer.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/democontainer.jar"]