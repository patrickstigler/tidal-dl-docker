
FROM python:3.8.3-slim-buster

RUN pip install -U \
    pip \
    setuptools \
    wheel
	
ENV CONFIG_DIR=/tidal-dl/config
ENV DL_DIR=/tidal-dl/music
ENV USER="tidal"
ENV UID=99
ENV GID=100
ENV DATA_PERM=770

WORKDIR /

RUN mkdir -p $CONFIG_DIR && \
	mkdir - p $DL_DIR && \
	useradd -d $CONFIG_DIR -s /bin/bash $USER && \
	chown -R $USER $CONFIG_DIR && \
	chmod -R 777 $DL_DIR && \
	chown -R $UID:$GID $DL_DIR

WORKDIR $CONFIG_DIR

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

USER $USER
CMD python -m uvicorn main:app --host 0.0.0.0 --port 80