# Use a small Node base image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy dependency definitions
COPY package.json yarn.lock ./

# Install dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Build the Strapi admin UI
RUN npm run build

# Expose the Strapi port (default Strapi server runs on 1337)
EXPOSE 1337

# Start the Strapi server
CMD ["npm", "run", "start"]
