FROM node:lts-alpine

ENV HOME_FOLDER=/home/node/webcideca

RUN mkdir -m 777 -v -p ${HOME_FOLDER}
WORKDIR ${HOME_FOLDER}
COPY ["package.json", "package-lock.json", "./"]
RUN npm install --production
COPY . .