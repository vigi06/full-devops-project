FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY ./workspace/jenkins-master-slave/target/*.jar /app.jar
CMD ["java","-jar","app.jar"]