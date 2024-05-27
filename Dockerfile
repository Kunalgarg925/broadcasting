# Use Maven image to build the project
FROM jelastic/maven:3.9.5-openjdk-21 AS build

# Copy the entire project into the working directory
COPY . .

# Run Maven to clean and package the application, skipping tests
RUN mvn clean package -DskipTests

# Use a slim OpenJDK image to run the application
FROM openjdk:21-slim

# Copy the built jar file from the build stage to the current stage
COPY --from=build /app/target/broadcasting-0.0.1-SNAPSHOT.jar broadcasting.jar

# Expose the application port
EXPOSE 8080

# Set the entrypoint to run the jar file
ENTRYPOINT ["java", "-jar", "broadcasting.jar"]
