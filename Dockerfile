FROM ubuntu:18.04

WORKDIR /

RUN  apt-get update -y \
  && apt-get upgrade -y \
  && apt-get -f install \
  && apt-get install -y \
     wget \
     gconf2 \
     gconf-service \
     libgtk2.0-0 \
     libnotify4 \
     libxtst6 \
     libnss3 \
     python \
     gvfs-bin \
     xdg-utils \
     firefox \
     libxss1 \
     curl \
     libcurl4 \
     libgnome-keyring0 \
     curl \
     gnupg \
     libxkbfile1 \
  && rm -rf /var/lib/apt/lists/*

RUN  wget --quiet "https://github.com/siredmar/docker-gitkraken/releases/download/gitkraken-v6.5.1/GitKraken-v6.5.1.deb" -O /gitkraken-amd64.deb \
  && dpkg -i /gitkraken-amd64.deb \
  && rm /gitkraken-amd64.deb

# Download and verify gosu
ENV GOSU_VERSION 1.12
RUN set -e; \
    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
    curl -fsSL "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" -o /usr/local/bin/gosu; \
    curl -fsSL "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" -o /usr/local/bin/gosu.asc; \
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
    rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc; \
    chmod +x /usr/local/bin/gosu; \
    gosu --version

ENV HOME /home/user
ENV UID 1000
ENV GID 1000

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/gitkraken"]
