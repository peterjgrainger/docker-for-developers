# Take the smallest image available
FROM node:alpine

# Use environment variables for locations used often
ENV APP_DIR=/opt/node-demo

# Create a directory to run the app from
RUN mkdir -p ${APP_DIR}

RUN chown node:node ${APP_DIR}

# Run all following commands from the app dir
WORKDIR ${APP_DIR}

# The rest of the commands will be ran as the user node.
USER node

# Copy over required config files package backpack tsconfig
COPY package.json backpack.config.js tsconfig.json ${APP_DIR}/

# install deps
RUN npm install

# rebuild on change
CMD ["npm", "run", "dev"] 
