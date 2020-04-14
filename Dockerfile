FROM ich777/winehq-baseimage

LABEL maintainer="admin@minenet.at"

ENV DATA_DIR="/acc"
ENV GAME_PARAMS=""
ENV UMASK=000
ENV UID=99
ENV GID=100
ENV USER="acc"
ENV DATA_PERM=770

RUN mkdir $DATA_DIR && \
	useradd -d $DATA_DIR -s /bin/bash $USER && \
	chown -R $USER $DATA_DIR && \
	ulimit -n 2048

ADD /scripts/ /opt/scripts/
RUN chmod -R 770 /opt/scripts/
ADD /config/ /tmp/

#Server Start
ENTRYPOINT ["/opt/scripts/start.sh"]