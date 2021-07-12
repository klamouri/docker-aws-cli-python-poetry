ARG PYTHON_VERSION
FROM python:$PYTHON_VERSION-buster

ARG AWS_CLI_VERSION
ARG POETRY_VERION

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-$AWS_CLI_VERSION.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - --version $POETRY_VERION && \
    ln -s $HOME/.poetry/bin/poetry /usr/local/bin/poetry

ENTRYPOINT ["/bin/bash"]