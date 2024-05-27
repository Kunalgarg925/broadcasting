# Use Maven image to build the project
FROM jelastic/maven:3.9.5-openjdk-21 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project into the working directory
COPY . .

# Run Maven to clean and package the application, skipping tests
RUN mvn clean package -DskipTests

# Debug: List the contents of the target directory to verify the JAR file exists
RUN ls -l /app/target

# Use a slim OpenJDK image to run the application
FROM openjdk:21-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built jar file from the build stage to the current stage
COPY --from=build /app/target/broadcastingsystem-0.0.1-SNAPSHOT.jar broadcastingsystem.jar

# Expose the application port
EXPOSE 8080

# Set the entrypoint to run the jar file
ENTRYPOINT ["java", "-jar", "broadcastingsystem.jar"]
