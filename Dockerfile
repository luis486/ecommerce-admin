# Utilizamos la imagen oficial de Node.js versión 20.3.1 basada en Alpine Linux
FROM node:20-alpine

# Creamos el directorio de la aplicación en el contenedor
RUN mkdir -p /app
WORKDIR /app

# Copiamos el código fuente de la aplicación al directorio de trabajo del contenedor
COPY . .

# Limpiamos la caché de npm y realizamos la instalación de las dependencias
RUN npm cache clean --force
RUN npm install cloudinary --force

RUN npm install @prisma/client
RUN npm install stripe
RUN npx prisma generate

# Exponemos el puerto 3000 para que la aplicación esté disponible
EXPOSE 3000

# Ejecutamos el comando npm run dev para iniciar la aplicación
CMD ["npm", "run", "dev"]


