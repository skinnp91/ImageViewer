FROM node

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN yarn install --ignore-optional --offline

EXPOSE 8080

CMD ["yarn", "start"]