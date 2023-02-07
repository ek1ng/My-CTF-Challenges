FROM node:alpine

ENV PROJECT_ENV production

ENV NODE_ENV production

COPY app /app
WORKDIR /app
COPY flag /flag
RUN npm install --registry https://registry.npm.taobao.org/

CMD [ "node", "app.js" ]