# Use an official Node.js runtime as the base image
FROM node:14 AS build
# Set the working directory in the container
WORKDIR /app
# Copy package.json and package-lock.json to the container
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy all source files to the container
COPY . .
# Build the React app
RUN npm run build
# Use a smaller, production-ready base image
FROM nginx:alpine
# Copy the built React app from the build stage to the NGINX webserver directory
COPY --from=build /app/build /usr/share/nginx/html
# Expose port 80 for the NGINX server
EXPOSE 80
# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
