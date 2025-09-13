# Usa uma imagem oficial com JDK 17
FROM eclipse-temurin:17-jdk

# Define o diretório de trabalho
WORKDIR /app

# Copia o código do projeto
COPY . .

# Compila o projeto
RUN ./mvnw -DskipTests clean package

# Expõe a porta que o Render vai usar
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["java", "-Dserver.port=$PORT", "-Dspring.profiles.active=dev", "-jar", "target/apple-academy-api-0.0.1-SNAPSHOT.jar"]
