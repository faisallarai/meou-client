# Stage 1: build
FROM node:16-alpine as build

WORKDIR /app

# add the node_modules folder to $PATH
ENV PATH /app/node_modules/.bin:$PATH


COPY ./package.json /app/

# install  dependencies
RUN yarn --silent

# copy everything to /app directory
COPY . /app

CMD [ "npm", "start" ]