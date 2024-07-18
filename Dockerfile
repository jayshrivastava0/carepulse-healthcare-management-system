# Use the official Ubuntu base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /root/healthcare_management

COPY package*.json ./
# Copy the rest of the application code
COPY . .

# Update the package list and install any dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y build-essential && \
    apt-get install -y nodejs npm

# Install application dependencies (assuming a Node.js application)
RUN npm install

# Expose the port your app runs on
EXPOSE 3000

# Command to run your application
CMD ["npm", "run", "dev"]

# Volume mount command
VOLUME ["E:/Projects/healthcare_management:/root/healthcare_management"]
