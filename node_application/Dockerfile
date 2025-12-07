FROM node:14


# it says all the subsequent commands should be executed
# within this working directory - mean all following command will
# assume we are currently inside this folder
# note: if the folder doesn't exist, it'll be auto created
WORKDIR /app

COPY . .

RUN npm install

EXPOSE 80

CMD [ "node", "server.js" ]
