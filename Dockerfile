FROM python:3.8-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN pip3 install git-filter-repo

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]