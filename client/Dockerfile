# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source files to the container
COPY . .

# Expose the port your Node.js server is listening on (e.g., 3001)
EXPOSE 3001

# Start your Node.js application
CMD ["node", "server.js"]
