FROM docker.io/library/gradle:6 AS builder

ARG bbb_ref=v2.3.0
ENV bbb_ref ${bbb_ref}

ADD "https://codeload.github.com/bigbluebutton/bigbluebutton/tar.gz/${bbb_ref}" /src/bigbluebutton-src.tar.gz
RUN mkdir /src/bigbluebutton && \
    tar -o -C /src/bigbluebutton --strip-components=1 -xf /src/bigbluebutton-src.tar.gz

COPY bbb_api_conf.jsp /src/bigbluebutton/bbb-api-demo/src/main/webapp/

WORKDIR /src/bigbluebutton/bbb-api-demo
RUN gradle --no-watch-fs resolveDeps && gradle --no-watch-fs build

FROM docker.io/library/jetty:latest

COPY --from=builder /src/bigbluebutton/bbb-api-demo/build/libs/demo.war /var/lib/jetty/webapps/
