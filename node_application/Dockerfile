FROM node:14


# it says all the subsequent commands should be executed
# within this working directory - mean all following command will
# assume we are currently inside this folder
# note: if the folder doesn't exist, it'll be auto created
WORKDIR /app

# Image building is layer based - each operations is a layer
# Whenever we build an image - it's caches these layer during image build process
# During next build, docker takes the previous cache instead of rebuilding that layer unless that layer has some change
# If a layer is found to have some change, from the layer and all the subsequent layers will be rebuilt
# We can optimize the Dockerfile through this layer based caching to reduce image build process

# COPY . .

# RUN npm install

# EXPOSE 80

# CMD [ "node", "server.js" ]

# Following are the optimized steps

# We know npm install command takes time as it builds node modules by generating dependencies
# Assume you made any changes in the source code, but not on package json
# Just because we perform COPY . ., package json also gets involved and the subsequent npm install command gets executed
# unnecessarily as there is a diff in src code and increase the time taken to build an image. Now by moving package json and npm install before,
# the build doesn't need to re-execute the npm install and instead it can take from cache and only source code can be copied as there is a diff

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

CMD ["node", "server.js"]
