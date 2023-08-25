# Utiliza una imagen base con Node.js preinstalado
FROM node:14

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo package.json y package-lock.json (si existe) al directorio de trabajo
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Instala las dependencias específicas
RUN npm install node-red-contrib-whatsapp-link@~0.1.37 node-red-dashboard@~3.3.1 puppeteer@^19.7.5

# Copia todo el contenido del directorio actual al directorio de trabajo en el contenedor
COPY . .

# Expone el puerto que utiliza Node-Red (generalmente 1880)
EXPOSE 1880

# Comando para iniciar Node-Red cuando se ejecute el contenedor
CMD ["npm", "start"]
