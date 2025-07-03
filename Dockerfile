# 1. Define a imagem base
# Usar uma imagem 'slim' é um bom equilíbrio entre tamanho e ter as ferramentas necessárias.
FROM python:3.13.5-alpine3.21

# 2. Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# 3. Copiar o arquivo de dependências
# É importante copiar e instalar as dependências em um passo separado
# para aproveitar o cache de camadas do Docker.
COPY requirements.txt .

# 4. Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiar o código da aplicação para o diretório de trabalho
COPY . .

# 6. Expor a porta que a aplicação irá rodar
EXPOSE 8000

# 7. Comando para iniciar a aplicação com Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]