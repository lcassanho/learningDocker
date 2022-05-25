FROM maven:3.5.2-jdk-8-alpine as build

WORKDIR /temp/

COPY . .

RUN mvn clean install

FROM openjdk:8-jre-alpine

COPY --from=build /temp/target/demoDocker-0.0.1-SNAPSHOT.jar $CATALINA_HOME/webapps/demoDocker-0.0.1-SNAPSHOT.jar

WORKDIR $CATALINA_HOME/webapps/

ENTRYPOINT ["java", "-jar", "demoDocker-0.0.1-SNAPSHOT.jar"]