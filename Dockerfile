FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-cacher-ng && rm -rf /var/lib/apt/lists/*

EXPOSE 3142

VOLUME /var/cache/apt-cacher-ng

WORKDIR /app

ADD run.sh /app/

CMD ["/app/run.sh"]
