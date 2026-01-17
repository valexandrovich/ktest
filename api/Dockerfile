FROM eclipse-temurin:25-jdk-jammy AS builder
WORKDIR /app

COPY gradlew gradlew.bat settings.gradle build.gradle ./
COPY gradle/ gradle/
RUN chmod +x gradlew

RUN ./gradlew --no-daemon --no-build-cache dependencies || true
COPY src/ src/

RUN ./gradlew --no-daemon clean bootJar --parallel

FROM eclipse-temurin:25-jre-jammy
WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/build/libs/*.jar app.jar

RUN groupadd -r appuser && useradd -r -g appuser appuser && \
    chown -R appuser:appuser /app
USER appuser

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java -XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0 $JAVA_OPTS -jar app.jar"]
