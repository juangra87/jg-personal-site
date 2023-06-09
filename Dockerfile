FROM node:16-alpine

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add git

COPY ./package*.json /app/

RUN npm install && npm cache clean --force
RUN npm run build

COPY . .

ENV PATH ./node_modules/.bin/:$PATH