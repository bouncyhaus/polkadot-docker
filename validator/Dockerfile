ARG DEBIAN_TAG=10.9-slim
FROM debian:${DEBIAN_TAG}

ARG POLKADOT_VERSION=0.9.3

ENV POLKADOT_DOWNLOAD_BASEURL=https://github.com/paritytech/polkadot/releases/download/v${POLKADOT_VERSION}

ADD ${POLKADOT_DOWNLOAD_BASEURL}/polkadot ./artifacts/polkadot
ADD ${POLKADOT_DOWNLOAD_BASEURL}/polkadot.sha256 polkadot.sha256
RUN sha256sum --check --status polkadot.sha256 && \
  cp ./artifacts/polkadot /usr/local/bin && \
  chmod +x /usr/local/bin/polkadot && \
  rm -rf polkadot.sha256 ./artifacts

RUN useradd -m -u 1000 -U -s /bin/sh -d /polkadot polkadot && \
  mkdir -p /polkadot/.local/share && \
  mkdir /data && \
  chown -R polkadot:polkadot /data && \
  ln -s /data /polkadot/.local/share/polkadot && \
  rm -rf /usr/bin /usr/sbin

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENV CHAIN=polkadot \
  DATABASE=RocksDb \
  WASM_EXECUTION=Compiled \
  PRUNING=1000

USER polkadot
EXPOSE 30333 9933 9944 9615
VOLUME [ "/data" ]

ENTRYPOINT [ "/entrypoint.sh" ]
