# Verwende ein Python 3.9 Image
FROM python:3.9-slim

# Setze Arbeitsverzeichnis
WORKDIR /app

# Kopiere die requirements.txt und installiere Abhängigkeiten
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Installiere MariaDB-Client (oder mysql-client)
RUN apt-get update && apt-get install -y mariadb-client && apt-get clean

# Kopiere den Rest der App
COPY . .

# Mache das startup.sh Skript ausführbar
RUN chmod +x ./startup.sh

# Setze Umgebungsvariablen für Flask
ENV FLASK_APP=app
ENV FLASK_ENV=production

# Exponiere Port 5000
EXPOSE 5000

# Starte die Flask App
CMD ["./startup.sh"]
