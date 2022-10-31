
FROM python:3.8.3-slim-buster

RUN pip install -U \
    pip \
    setuptools \
    wheel
	
ENV DATA_DIR=/tidal-dl	
ENV CONFIG_DIR=/tidal-dl/config
ENV DL_DIR=/tidal-dl/music

ENV UMASK=000
ENV UID=99
ENV GID=100
ENV DATA_PERM=770
ENV USER="tidal"
EXPOSE 80

WORKDIR /

RUN mkdir -p $CONFIG_DIR && \
	mkdir -p $DL_DIR && \
	useradd -d $CONFIG_DIR -s /bin/bash $USER && \
	chmod -R 770 $CONFIG_DIR && \
	chown -R $USER $CONFIG_DIR && \
	chmod -R 770 $DL_DIR && \
	chown -R $UID:$GID $DL_DIR

COPY /scripts/start.sh /opt/scripts/start.sh
RUN chmod -R 770 /opt/scripts/

WORKDIR $DATA_DIR

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

USER $USER
ENTRYPOINT ["/opt/scripts/start.sh"]