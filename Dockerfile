# DOCKER-VERSION 0.7.2

FROM	fedora:latest@sha256:6c75d5bf57cb0fa5aa4b92c6a83c86c791644496d9ac230de7711f5b8ec3b898

# Install Node.js and npm
RUN	yum -y install nodejs npm

# Bundle app source
ADD	. /src

# Install app dependencies
RUN	cd /src; npm install

EXPOSE	8080

CMD	["node", "/src/index.js"]

