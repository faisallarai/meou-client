# Stage 1: build
FROM node:16-alpine as build

WORKDIR /app

COPY ./package.json /app

# install  dependencies
RUN yarn --silent

# copy everything to /app directory
COPY . /app

CMD [ "npm", "start" ]