FROM node:20-alpine

WORKDIR /app

# Copiar archivos de dependencias
COPY package.json package-lock.json ./

# Instalar dependencias con --legacy-peer-deps para resolver conflictos
RUN npm ci --legacy-peer-deps

# Copiar el resto de archivos
COPY . .

# Construir la aplicación
RUN npm run build

# Exponer el puerto que utiliza Astro
EXPOSE 4321

# Comando para iniciar la aplicación
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"] 