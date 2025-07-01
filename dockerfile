FROM openjdk:17-jdk-slim

# Установим необходимые утилиты для отладки (по желанию)
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Скачиваем последнюю версию wiremock standalone
ADD https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/2.35.0/wiremock-jre8-standalone-2.35.0.jar  /wiremock.jar

# Создаем папку для моков и логов
RUN mkdir -p /home/wiremock/mappings /home/wiremock/__files

# Копируем ваши mappings
COPY mappings /home/wiremock/mappings

# Опционально: копируем файлы (если используете `bodyFileName`)
# COPY __files /home/wiremock/__files

EXPOSE 8080

# Добавляем JVM опции:
# -Dwiremock.maxRequestJournalLogSize — увеличивает размер сохраняемого тела запроса
# --verbose — вывод подробных логов
CMD ["java", "-jar", "/wiremock.jar", "--port", "8080", "--global-response-templating", "--root-dir", "/home/wiremock", "--verbose", "-Dwiremock.maxRequestJournalLogSize=2048"]