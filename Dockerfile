FROM h3poteto/elixir:1.9.4-slim-buster

USER root
ENV RUST_VERSION 1.42.0

WORKDIR /tmp/

RUN set -ex && \
    curl -O https://static.rust-lang.org/dist/rust-${RUST_VERSION}-x86_64-unknown-linux-gnu.tar.gz && \
    tar -xvf rust-${RUST_VERSION}-x86_64-unknown-linux-gnu.tar.gz && \
    rust-${RUST_VERSION}-x86_64-unknown-linux-gnu/install.sh && \
    rm -rf rust-${RUST_VERSION}-x86_64-unknown-linux-gnu && \
    rm rust-${RUST_VERSION}-x86_64-unknown-linux-gnu.tar.gz

USER elixir
WORKDIR /var/opt/app
