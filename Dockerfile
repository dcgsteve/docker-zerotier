FROM ubuntu:xenial

RUN apt-get update && apt-get install -y curl screen supervisor
RUN curl -L -o /tmp/zerotier-install.sh https://install.zerotier.com/ && bash /tmp/zerotier-install.sh || exit 0

COPY files/supervisor-zerotier.conf /etc/supervisor/conf.d
COPY files/start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

VOLUME /var/lib/zerotier-one

ENTRYPOINT /opt/start.sh
