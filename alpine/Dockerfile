FROM node:10.15-alpine

ARG BUILD_DATE=0000-00-00
ARG VCS_REF=00000000

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/mirageglobe/testcafe.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="testcafe-jessie" \
      org.label-schema.description="docker image with testcafe and jessie" \
      org.label-schema.url="https://github.com/mirageglobe/testcafe"

ENV \
  TESTCAFE_ENV=CI \
  TESTCAFE_VERSION="1.1.0" \
  TERM=xterm \
  TINI_VERSION="v0.18.0" \
  DEPS="chromium \
        xwininfo \
        xvfb \
        dbus \
        eudev \
        ttf-freefont \
        fluxbox \
        procps"

# default app (optional)
WORKDIR /opt/app

# pre update requirements
RUN apk --no-cache upgrade \
    && apk --no-cache add tini \
    && apk --no-cache add $DEPS \
    && npm install -g testcafe@${TESTCAFE_VERSION}
    # using tini process manager - https://github.com/krallin/tini \

# default init
ENTRYPOINT ["/sbin/tini", "--"]

# default command
CMD ["testcafe"]
EXPOSE 1337 1338
