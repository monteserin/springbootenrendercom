# Build stage
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package -DskipTests

FROM openjdk:8-alpine
COPY --from=build /home/app/target/ListaInvitados-0.0.1-SNAPSHOT.war /usr/share/app.war
ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/app.war"]