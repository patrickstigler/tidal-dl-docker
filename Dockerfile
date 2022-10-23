FROM python:3.9-slim
WORKDIR /tidal-dl
RUN pip3 install tidal-dl --upgrade

ENTRYPOINT /usr/local/bin/tidal-dl