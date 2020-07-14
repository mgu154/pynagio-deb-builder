ARG dis='ubuntu'
ARG rel='bionic'

FROM ${dis}:${rel}

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
ENV dis=${rel}

# Volumes
VOLUME /packages

# Install build dependencies
RUN rm -f /etc/dpkg/dpkg.cfg.d/excludes && \
  apt-get update && \
  apt-get -y install \
    build-essential \
    debhelper \
    make \
    autoconf \
    automake \
    patch \
    dpkg-dev \
    fakeroot \
    pbuilder \
    gnupg \
    dh-make \
    libssl-dev \
    libpcre3-dev \
    ruby \
    ruby-dev \
    python3-dev \
    python3-setuptools \
    autotools-dev \
    pkg-config \
    git \
    ca-certificates \
    --no-install-recommends

WORKDIR /pynagio

RUN git clone https://github.com/RTBHOUSE/pynagio.git /pynagio && \
    git fetch && \
    git pull

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
