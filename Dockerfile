FROM maven:3.8.6-openjdk-11 AS build
RUN mvn dependency:go-offline
RUN mvn package -DskipTests
FROM openjdk:17
COPY --from=build /target/*.jar app-devops.jar
EXPOSE 80
CMD ["java", "-jar", "app-devops.jar", "--server.port=80"]