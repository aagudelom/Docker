FROM node:lts-alpine

ARG HOME_FOLDER

RUN mkdir -p  ${HOME_FOLDER}
RUN chmod -R 777 ${HOME_FOLDER}
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production
COPY . .
CMD [ "node", "server.js" ]