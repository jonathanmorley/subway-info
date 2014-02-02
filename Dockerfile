# DOCKER-VERSION 0.7.2

FROM	fedora:latest

# Install Node.js and npm
RUN	yum -y install nodejs npm

# Bundle app source
ADD	. /src

# Install app dependencies
RUN	cd /src; npm install

EXPOSE	8080

CMD	["node", "/src/index.js"]

