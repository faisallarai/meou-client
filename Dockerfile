# Stage 1: build
FROM node:16-alpine as build

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH
COPY package.json /app/package.json

RUN npm i --silent

COPY . /app

RUN npm run build

# Stage 2: prod
FROM nginx:1.21.5-alpine

COPY --from=build /app/build /usr/share/nginx/html

COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]