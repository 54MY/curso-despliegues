FROM eclipse-temurin:8-jre

ENV TZ=America/La_Paz
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

COPY demo-0.0.1-SNAPSHOT.jar app.jar
COPY application.properties /config/application.properties

EXPOSE 9091

ENTRYPOINT ["java","-jar","app.jar","--spring.config.location=/config/application.properties"]
