# Usa una imagen base de Node.js
FROM node:20

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el package.json y el package-lock.json al contenedor
COPY package*.json ./

# Instala todas las dependencias del proyecto
RUN npm ci

# Copia el resto de los archivos del proyecto al contenedor
COPY . .

# Construye la aplicación
RUN npm run build

# Elimina las dependencias de desarrollo
RUN npm prune --production

# Expone el puerto en el que la aplicación se ejecutará
EXPOSE 3000

# Define el comando para ejecutar la aplicación
CMD ["npm", "run", "start:prod"]