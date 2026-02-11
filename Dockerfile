FROM node:20-alpine

USER node

WORKDIR /home/node/app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]

