ARG PYTHON_VERSION
FROM python:$PYTHON_VERSION-buster

ARG AWS_CLI_VERSION
ARG POETRY_VERSION

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-$AWS_CLI_VERSION.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws

RUN curl -sSL https://install.python-poetry.org | POETRY_VERSION=$POETRY_VERSION python3 - && \
    ln -s $HOME/.poetry/bin/poetry /usr/local/bin/poetry

ENTRYPOINT ["/bin/bash"]