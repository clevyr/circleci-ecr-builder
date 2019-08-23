FROM docker:stable-git

RUN set -x \
    && apk add --no-cache \
        jq \
        make \
        python3 \
        curl \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade \
        awscli \
        pip \
        setuptools \
    && if ! command -v pip >/dev/null 2>&1; then \
        ln -s pip3 /usr/bin/pip; \
    fi \
    && if ! command -v python >/dev/null 2>&1; then \
        ln -s /usr/bin/python3 /usr/bin/python; \
    fi \
    && curl -L -o levant https://github.com/jrasell/levant/releases/download/0.2.6/linux-amd64-levant \
    && chmod a+x levant \
    && mv levant /usr/local/bin/levant

CMD ["/bin/sh"]
