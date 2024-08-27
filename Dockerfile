FROM python:alpine

ENV PYTHONDONTWRITEBYTECODE 0
ENV PYTHONUNBUFFERED 1

RUN apk update \
    && apk upgrade --available \
    && apk add --update --no-cache vim curl bind-tools jq yq openssl \
    && rm -rf /var/cache/apk/*

COPY dotfiles /root
COPY bin /root/bin
RUN chmod a+x /root/bin/*

ENV PYTHONSTARTUP=/root/.pythonrc
RUN python -m pip install --upgrade --no-cache-dir pip requests \
    && rm -f /root/.python_history

ENV PATH=${PATH}:/root/bin

ENTRYPOINT [ "sh", "-l" ]

WORKDIR /root
