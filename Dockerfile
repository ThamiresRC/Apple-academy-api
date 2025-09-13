# Usa JDK 17
FROM eclipse-temurin:17-jdk

# Diretório de trabalho
WORKDIR /app

# Copia o código
COPY . .

# Ajusta finais de linha do mvnw (caso tenha vindo do Windows) e dá permissão de execução
RUN sed -i 's/\r$//' mvnw && chmod +x mvnw

# Build (modo batch para evitar prompts) e sem testes
RUN ./mvnw -B -DskipTests clean package

# Porta que o app usa (Render injeta $PORT)
EXPOSE 8080

# Sobe o app (pega qualquer .jar gerado)
CMD ["sh","-c","java -Dserver.port=${PORT} -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE:-dev} -jar target/apple-academy-api-0.0.1-SNAPSHOT.jar"]



