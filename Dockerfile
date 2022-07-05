# Test web-app to use with Pluralsight courses and Docker Deep Dive book
# Linux x64
FROM alpine:3.15

LABEL maintainer="nigelpoulton@hotmail.com"

# Install Node and NPM

RUN sed -i -e 's/http:/https:/' /etc/apk/repositories

RUN apk add --update --no-cache \
        curl \
        nodejs \
        npm

# Copy app to /src
COPY . /src

WORKDIR /src

# Install dependencies
RUN  npm install

EXPOSE 8080

ENTRYPOINT ["node", "./app.js"]
