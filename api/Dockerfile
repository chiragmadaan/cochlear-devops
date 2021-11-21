FROM node:16

WORKDIR /api

COPY package.json .

RUN npm install

COPY . .

ENV PORT 9000
EXPOSE $PORT

CMD ["npm", "start"]