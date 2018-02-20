# Take the smallest image available
FROM node:alpine as build-layer

# Use environment variables for locations used often
ENV APP_DIR=/opt/node-demo

# Create a directory to run the app from
RUN mkdir -p ${APP_DIR}

# Give permission to node
RUN chown node:node ${APP_DIR}

# Run all following commands from the app dir
WORKDIR ${APP_DIR}

# The rest of the commands will be ran as the user node.
USER node

# Copy over the package.json for npm install
COPY package.json ${APP_DIR}/

# Install all of the dependences - saves cache, includes dev dependences
RUN npm install

# Copy files that are rarely changed
COPY backpack.config.js tsconfig.json ${APP_DIR}/

# Copy the src files to the app directory
COPY src/ ${APP_DIR}/src 

# Build the app
RUN npm run build

# Second stage that will run in prod
FROM node:alpine

# Set environment to production
ENV NODE_ENV=production

# Use environment variables for locations used often
ENV APP_DIR=/opt/node-demo

# Create a directory to run the app from
RUN mkdir -p ${APP_DIR}

# Give permission to node
RUN chown node:node ${APP_DIR}

# The rest of the commands will be ran as the user node.
USER node

# Copy relavant files from the build layer
COPY --from=build-layer ${APP_DIR}/build/ ${APP_DIR}/

# Copy over the package.json for npm install
COPY package.json ${APP_DIR}/

# Run from the node directory
WORKDIR ${APP_DIR}

# Install all of the production dependences - saves cache
RUN npm install

# so other containers can connect
EXPOSE 3000

# Run the main file
CMD ["node", "main.js"] 
