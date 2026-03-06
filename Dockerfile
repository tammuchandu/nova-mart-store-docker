# Use OpenJDK 21
FROM eclipse-temurin:21-jdk-jammy

# Set working directory
WORKDIR /app

# Copy WAR file (Spring Boot embedded Tomcat)
COPY target/app.war app.war

# Expose port
EXPOSE 8080

# Run the WAR
ENTRYPOINT ["java", "-jar", "app.war"]
