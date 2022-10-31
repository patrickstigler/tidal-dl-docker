
FROM python:3.8.3-slim-buster

RUN pip install -U \
    pip \
    setuptools \
    wheel
	
ENV DATA_DIR=/tidal-dl	

ENV UMASK=000
ENV UID=99
ENV GID=100
ENV DATA_PERM=770
ENV USER="tidal"
EXPOSE 80

WORKDIR /

RUN mkdir -p $DATA_DIR && \
	useradd -d $DATA_DIR -s /bin/bash $USER && \
	chmod -R 770 $DATA_DIR && \
	chown -R $USER $DATA_DIR && \
	chown -R $UID:$GID $DATA_DIR

COPY /scripts/start.sh /opt/scripts/start.sh
RUN chmod -R 770 /opt/scripts/

WORKDIR $DATA_DIR

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENTRYPOINT ["/opt/scripts/start.sh"]