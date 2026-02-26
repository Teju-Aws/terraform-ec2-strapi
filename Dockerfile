FROM node:18-alpine

WORKDIR /app

# Copy only package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of code
COPY . .

# Build Strapi admin
RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]
