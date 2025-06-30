FROM openjdk:17-jdk-slim

# Скачиваем WireMock standalone jar
ADD https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/2.35.0/wiremock-jre8-standalone-2.35.0.jar /wiremock.jar

# Копируем ваши моки (если есть) в контейнер
COPY mappings /home/wiremock/mappings

EXPOSE 8080

CMD ["java", "-jar", "/wiremock.jar", "--port", "8080", "--global-response-templating", "--root-dir", "/home/wiremock"]