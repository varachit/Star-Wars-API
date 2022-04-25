FROM alpine:3.15
WORKDIR /frontend
ENV PATH="./node_modules/.bin:$PATH"
COPY . .

RUN apk update && apk add curl
RUN curl -sL https://deb.nodesource.com/setup_18.x
RUN apk update && apk add --update nodejs npm

RUN npm install
RUN npm run build

CMD ["npm", "start"]