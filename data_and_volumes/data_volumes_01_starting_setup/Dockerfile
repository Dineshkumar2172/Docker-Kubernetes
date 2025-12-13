FROM node:14

WORKDIR /app

ARG DEFAULT_PORT=80

COPY package.json .

RUN npm install

COPY . .

ENV APP_PORT=$DEFAULT_PORT

EXPOSE $APP_PORT

CMD ["node", "server.js"]
