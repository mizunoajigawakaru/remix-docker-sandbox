FROM node:21-bullseye-slim
WORKDIR /myapp

### Copy the lock and package file

ADD package.json ./

### Install dependencies

RUN npm install --include=dev

### Copy your source code

### If only files in the src folder changed, this is the only step that gets executed!

ADD . .

RUN npm run build && npm prune --omit=dev

CMD ["npm", "start"]