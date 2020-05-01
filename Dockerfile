FROM debian:buster-slim

ENV MONGO_VERSION 4.2

RUN apt-get update; apt-get install -y --no-install-recommends apt-transport-https ca-certificates gnupg

RUN apt-key adv --fetch-keys https://packages.cloud.google.com/apt/doc/apt-key.gpg; \
    apt-key adv --fetch-keys https://www.mongodb.org/static/pgp/server-$MONGO_VERSION.asc; \
    echo "deb http://packages.cloud.google.com/apt cloud-sdk-buster main" > /etc/apt/sources.list.d/gcloud-sdk.list; \
    echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/$MONGO_VERSION main" > /etc/apt/sources.list.d/mongodb-org-$MONGO_VERSION.list; \
    apt-get update; \
    apt-get install -y --no-install-recommends google-cloud-sdk mongodb-org-tools; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*
