FROM node:18.15.0-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm ci --omit dev
RUN npm i -g sequelize-cli
RUN npm cache clean -f

COPY . .

ENTRYPOINT [ "/bin/sh", "entrypoint.sh" ]
