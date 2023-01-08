FROM node:alpine

ENV PROJECT_ENV production

ENV NODE_ENV production
WORKDIR /app
ADD . /app
RUN npm install -g http-server --registry https://registry.npm.taobao.org/
EXPOSE 80

CMD http-server ./src -p 80