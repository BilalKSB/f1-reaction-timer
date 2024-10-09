# Utiliser l'image Node officielle comme base
FROM node:16-alpine

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copier le fichier package.json et package-lock.json dans le conteneur
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers du projet dans le conteneur
COPY . .

# Compiler le code TypeScript
RUN npm run build

# Exposer le port sur lequel l'application s'exécute
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "start"]