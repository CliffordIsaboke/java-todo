FROM gradle:latest AS build

WORKDIR /usr/app
COPY . .
RUN gradle build --no-daemon

FROM openjdk:17

# COPY --from=build /app/build/libs/todo-app.jar /todo-app.jar
COPY . .

# CMD ["java", "App"]
CMD ["java", "-jar", "/todo-app.jar"]
