# DOCKER-VERSION 0.7.2

FROM	fedora:latest@sha256:43b29f65a41eb9c35e1cd5323e3bdf3b655c2357a9f4f1ff2f9c2798e5045d80

# Install Node.js and npm
RUN	yum -y install nodejs npm

# Bundle app source
ADD	. /src

# Install app dependencies
RUN	cd /src; npm install

EXPOSE	8080

CMD	["node", "/src/index.js"]

