FROM node

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN yarn install --freeze-lockfile --ignore-optional

EXPOSE 8080

CMD ["yarn", "start"]