FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

ENV APP_PORT=80

EXPOSE $APP_PORT

CMD ["node", "server.js"]
