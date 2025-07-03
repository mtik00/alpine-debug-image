FROM python:alpine

ENV PYTHONDONTWRITEBYTECODE=0
ENV PYTHONUNBUFFERED=1
ENV PYTHONSTARTUP=/home/app-user/.pythonrc

WORKDIR /home/app-user

RUN apk update \
    && apk upgrade --available \
    && apk add --update --no-cache vim curl bind-tools jq yq openssl sudo \
    && rm -rf /var/cache/apk/*

COPY dotfiles /home/app-user
COPY bin /home/app-user/bin
COPY etc /etc

RUN chmod a+x /home/app-user/bin/* \
    && chmod 644 /etc/.login-message \
    && python -m pip install --upgrade --no-cache-dir pip httpx \
    && rm -f /home/app-user/.python_history \
    && adduser -g "App User" app-user -D \
    && addgroup app-user wheel \
    && echo "app-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER app-user

ENTRYPOINT [ "ash", "-l" ]
