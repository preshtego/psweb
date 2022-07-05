# Test web-app to use with Pluralsight courses and Docker Deep Dive book
# Linux x64
FROM alpine:3.12

LABEL maintainer="nigelpoulton@hotmail.com"

# Install Node and NPM
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
