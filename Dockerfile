FROM ubuntu:22.04

# Updates and installs
RUN apt update && apt -y install \
    software-properties-common \
    nano \
    wget \
    python3 \
    python3-pip

# Install Tidal-dl:
RUN pip3 install tidal-dl --upgrade


EXPOSE 80
VOLUME ["/dl"]
VOLUME ["/config"]
CMD ["/bin/sh", "/bin/start.sh"]
