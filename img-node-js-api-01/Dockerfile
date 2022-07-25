#Imagen base oficial de node usando alpine para reducir el tamano
FROM node:alpine

# Se crea el directorio de despliegue de la aplicacion
WORKDIR /usr/src/app

#Se copia el manifiesto de dependencias
COPY package*.json ./

# Se realiza una instalación limpia de las dependencias 
# asegurandonos de la limpieza de la cache npm
# RUN npm ci --only=production -- estaba generando un WARN por eso
# se cambia a --omit=dev
RUN npm ci --omit=dev

# Se copian los archivo de la carpeta local al directorio de la aplicacion
COPY . .

#Se expone el puerto por donde atendera la aplicacion
EXPOSE 3000

#Se define una variable de ambiente para NodeJS
ENV NODE_ENV=production

# Se inicia la aplicacion
CMD ["node", "index.js"]