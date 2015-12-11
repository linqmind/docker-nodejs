FROM cloudcube/base

MAINTAINER DavidZhao <zhaohaibin@outlook.com>

ENV REFRESHED_AT 2015-09-06 15:48

RUN \
    apt-get update && \
    apt-get install npm nodejs git -y && \
    npm install -g grunt-cli && \
	npm install -g nrm

RUN ln -s "$(which nodejs)" /usr/bin/node

RUN echo "export LC_ALL=C" >> /root/.bashrc

ADD auth/id_rsa_docker /root/.ssh/id_rsa

ADD auth/id_rsa_docker.pub /root/.ssh/id_rsa.pub

RUN chmod 0600 /root/.ssh/*

ADD assets /nodeserver

EXPOSE 22

RUN chmod +x /nodeserver/startup

CMD ["/nodeserver/startup"]


