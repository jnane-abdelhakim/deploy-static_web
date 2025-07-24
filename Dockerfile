FROM nginx:alpine

COPY ./static_web /usr/share/nginx/html

EXPOSE 80
