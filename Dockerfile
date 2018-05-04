FROM node:9-alpine

MAINTAINER Codevski <1435321+codevski@users.noreply.github.com>

LABEL maintainer "Codevski (https://github.com/codevski/DiscordBot)"

VOLUME /config /data

# 22 = ssh, 80 = HTTP, 443 = HTTPS, 3000 = MEAN.JS server, 35729 = livereload, 8080 = node-inspector
EXPOSE 22 80 443 3000 35729 8080

# Install utilities
RUN apk update && \
    apk update
    apk upgrade && \
    apk --no-cache add openssh && \
    rc-update add sshd && \
    /etc/init.d/sshd start \

# Add the files
ADD test /data
