FROM openjdk:8u151-jdk-alpine3.7 as build
  
EXPOSE 8080

WORKDIR $APP_HOME
 
ENV APP_HOME /usr/src/app

COPY target/secretsanta-0.0.1-SNAPSHOT.jar $APP_HOME/app.jar


FROM gcr.io/distroless/java17-debian12
COPY --from=build $APP_HOME /app
ENTRYPOINT ["java","-jar","/app/app.jar"]
