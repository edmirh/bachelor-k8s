FROM node:14-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm i pm2 -g

EXPOSE 8080

CMD ["pm2", "start", "bin/www", "--no-daemon"]