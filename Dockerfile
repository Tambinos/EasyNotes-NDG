#Verwenden des offiziellen Node.js Images als Grundlage
FROM node:16

# 2. Einen neuen Benutzer erstellen
RUN useradd -ms /bin/bash appuser

# 3. Auf diesen Benutzer wechseln
USER appuser

# 4. Arbeitsverzeichnis auf /app setzen
WORKDIR /app

# 5. Den Quellcode kopieren
COPY . .

# 6. Alle npm Pakete installieren
RUN npm install

# 7. Easy-Notes bauen
RUN npm run build

# 8. Port festlegen (z.B. 8080)
EXPOSE 8080

# 9. Arbeitsverzeichnis auf das /app/dist Verzeichnis wechseln
WORKDIR /app/dist

# 10. Die Node-Applikation ausführen
CMD ["node", "index.js"]
# 1. Verwenden des offiziellen Node.js Images als Grundlage
FROM node:16

# 2. Einen neuen Benutzer erstellen
RUN useradd -ms /bin/bash appuser

# 3. Das Arbeitsverzeichnis erstellen und Rechte setzen
RUN mkdir -p /app && chown -R appuser:appuser /app

# 4. Auf diesen Benutzer wechseln
USER appuser

# 5. Arbeitsverzeichnis auf /app setzen
WORKDIR /app

# 6. Den Quellcode kopieren
COPY . .

# 7. Alle npm Pakete installieren
RUN npm install

# 8. Easy-Notes bauen
RUN npm run build

# 9. Port festlegen (z.B. 8080)
EXPOSE 8080

# 10. Arbeitsverzeichnis auf das /app/dist Verzeichnis wechseln
WORKDIR /app/dist

# 11. Die Node-Applikation ausführen
CMD ["node", "index.js"]
