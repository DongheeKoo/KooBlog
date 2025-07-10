FROM amazoncorretto:17.0.7-alpine3.17 as builder
WORKDIR /app
COPY . .
RUN chmod +x ./gradlew && ./gradlew clean build -x test

##### Second Stage : Runner #####

FROM amazoncorretto:17.0.7-alpine3.17
RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f
COPY --from=builder /app/build/libs/*.jar /app.jar
ENV JAVA_OPTS="-Xms512M -Xmx2G"
ENTRYPOINT ["java","-jar","-Duser.timezone=Asia/Seoul","/app.jar"]