# Take the smallest image available
FROM node:alpine

# Create a directory to run the app from
RUN mkdir -p /opt/node-demo

# Run all following commands from the app dir
WORKDIR /opt/node-demo

# The rest of the commands will be ran as the user node.
USER node

# Copy over the package.json
COPY package.json .

# Install all of the dependences
RUN npm install
