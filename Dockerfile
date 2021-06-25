FROM ubuntu as download

RUN apt-get update -y; apt-get install -y curl zip gzip tar wget

RUN wget https://github.com/feliixx/mgodatagen/releases/download/v0.9.1/mgodatagen_0.9.1_Linux_x86_64.tar.gz && \
      ls -la mgodatagen_0.9.1_Linux_x86_64.tar.gz && \
      tar -xvf mgodatagen_0.9.1_Linux_x86_64.tar.gz && \
      ls -la mgodatagen

FROM scratch AS bin
COPY --from=download mgodatagen /
COPY mgodatagen.json /
ENTRYPOINT /mgodatagen -f mgodatagen.json