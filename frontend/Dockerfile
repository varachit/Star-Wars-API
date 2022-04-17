FROM alpine:3.15
WORKDIR /frontend
ENV PATH="./node_modules/.bin:$PATH"
COPY . .
RUN npm run build-prod
CMD ["npm", "start"]

#docker build --tag react.
#docker run react
#docker run --publish 3000:3000 react