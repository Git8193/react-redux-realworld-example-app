FROM node AS Build
COPY . /app
WORKDIR /app
RUN npm install
RUN npm run build
#MAINTAINER test

FROM nginx
RUN rm -rf /usr/share/nginx/html
RUN mkdir -p /usr/share/nginx/html
WORKDIR  /usr/share/nginx/html
COPY --from=Build /app/build .
