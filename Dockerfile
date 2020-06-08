# Node Image to build web content

FROM node:alpine as builder

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY . . 

RUN npm run build


#Nginx Image

FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html
