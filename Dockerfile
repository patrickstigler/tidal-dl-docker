FROM python:3.9-slim
WORKDIR /tidal-dl
RUN pip3 install tidal-dl --upgrade
CMD ["python", "/usr/local/bin/tidal-dl"] 