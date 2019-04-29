FROM node:10.15-stretch-slim

ARG BUILD_DATE=0000-00-00
ARG VCS_REF=00000000

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/mirageglobe/testcafe.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.name="testcafe-jessie" \
      org.label-schema.description="docker image with testcafe and stretch" \
      org.label-schema.url="https://github.com/mirageglobe/testcafe"

ENV \
  TESTCAFE_ENV=CI \
  TESTCAFE_VERSION="1.1.0" \
  TERM=xterm \
  TINI_VERSION="v0.18.0" \
  DEPS="apt-utils \
        chromium \
        dbus \
        fluxbox \
        ttf-freefont \
        procps \
        x11-utils \
        xorg \
        xvfb" \
  DEBIAN_FRONTEND=noninteractive

# default app (optional)
WORKDIR /opt/app

# pre update requirements
RUN apt-get update \
    && apt-get install -y --no-install-recommends $DEPS \
    && npm install -g testcafe@${TESTCAFE_VERSION} \
    # using tini process manager - https://github.com/krallin/tini \
    && wget https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini -O /tini \
    && chmod +x /tini

# default init
ENTRYPOINT ["/tini", "--"]

# default command
CMD ["testcafe"]
EXPOSE 1337 1338
