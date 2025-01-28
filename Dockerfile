#Verwenden des offiziellen Node.js Images als Grundlage
FROM node:16

# 2. Einen neuen Benutzer erstellen (oder vorhandenen Benutzer verwenden)
# Erstelle einen Benutzer namens 'appuser' (optional)
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
