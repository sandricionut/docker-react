
FROM node:alpine as builder

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . .

RUN npm start build


FROM nginx as production
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html