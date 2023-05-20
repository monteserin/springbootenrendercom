FROM openjdk:8-alpine
ADD target/ListaInvitados-0.0.1-SNAPSHOT.war /usr/share/app.war
ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/app.war"]