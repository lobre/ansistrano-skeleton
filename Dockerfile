FROM alpine:3.6

RUN set -x && \
	    addgroup -S deploy && \
	    adduser -D -S -G deploy deploy && \

	apk add --no-cache --virtual .build-deps \
        python-dev \
        libffi-dev \
        openssl-dev \
        build-base && \

    apk add --no-cache \
        python \
        py-pip \
        openssl \
        ca-certificates \
        sshpass \
        vim \
        rsync \
        openssh-client \
        git

RUN pip install --no-cache-dir ansible

COPY ansible.cfg /etc/ansible/ansible.cfg

RUN apk del .build-deps && \
    rm -rf /var/cache/apk/*

RUN mkdir /deploy && chown deploy:deploy /deploy

USER deploy

WORKDIR "/deploy"

COPY --chown=deploy:deploy . /deploy

RUN ansible-galaxy install -p roles -r requirements.yml && \
    mkdir /home/deploy/.ansistrano

CMD ash