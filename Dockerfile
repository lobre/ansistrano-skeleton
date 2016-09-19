FROM python:2

MAINTAINER Loric Brevet <lobre@smile.fr>

RUN apt-get update \
    && apt-get install -y \
    vim \
    rsync \
    ssh \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible

VOLUME ["/deploy"]
VOLUME ["/root"]

WORKDIR "/deploy"

ADD ["docker-cmd.sh", "/tmp/"]

CMD bash -c "/tmp/docker-cmd.sh";"bash"