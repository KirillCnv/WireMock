FROM openjdk:17-jdk-slim

ADD https://repo1.maven.org/maven2/org/wiremock/wiremock-standalone/3.0.1/wiremock-standalone-3.0.1.jar /wiremock.jar

COPY mappings /home/wiremock/mappings

WORKDIR /home/wiremock

EXPOSE 8080

CMD ["java", "-jar", "/wiremock.jar", "--port", "8080", "--global-response-templating", "--root-dir", "./", "--verbose", "-Dwiremock.maxRequestJournalLogSize=16384"]