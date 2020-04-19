FROM node:12.9.1-alpine

RUN set -x && \
    npm install -g prh@5.4.4 && \
    npm cache clean --force

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]