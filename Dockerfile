# Verwenden des offiziellen Node.js Images als Grundlage
FROM node:16

# 2. Einen neuen Benutzer erstellen
RUN useradd -ms /bin/bash appuser

# 3. Installiere sudo und füge den Benutzer zur sudo-Gruppe hinzu
RUN apt-get update && apt-get install -y sudo \
    && usermod -aG sudo appuser

# 4. Das Arbeitsverzeichnis erstellen und Rechte setzen
RUN mkdir -p /app && chown -R appuser:appuser /app

# 5. Auf diesen Benutzer wechseln
USER appuser

# 6. Arbeitsverzeichnis auf /app setzen
WORKDIR /app

# 7. Den Quellcode kopieren
COPY . .

# 8. Alle npm Pakete installieren
RUN npm install

# 9. Easy-Notes bauen
RUN npm run build

# 10. Port festlegen (z.B. 8080)
EXPOSE 8080

# 11. Arbeitsverzeichnis auf das /app/dist Verzeichnis wechseln
WORKDIR /app/dist

# 12. Die Node-Applikation ausführen
CMD ["node", "index.js"]

