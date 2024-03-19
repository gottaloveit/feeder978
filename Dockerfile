FROM ghcr.io/gottaloveit/base:latest

LABEL org.opencontainers.image.source = "https://github.com/gottaloveit/feeder978"
LABEL org.opencontainers.image.licenses = "MIT"
LABEL org.opencontainers.image.version=1.1.0

ADD https://www.flightaware.com/adsb/piaware/files/packages/pool/piaware/f/flightaware-apt-repository/flightaware-apt-repository_1.2_all.deb /tmp/

RUN dpkg -i /tmp/flightaware-apt-repository_1.2_all.deb && \
    apt update && \
    apt install -y dump978-fa

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY run.sh /run.sh

RUN chmod +x /run.sh

EXPOSE 8978 30978 30979 9001

ENTRYPOINT ["/run.sh"]
