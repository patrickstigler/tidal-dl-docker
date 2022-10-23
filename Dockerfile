FROM ubuntu:22.04

# Updates and installs
RUN apt update && apt -y install \
    build-essential \
    software-properties-common \
    nano \
    curl \ 
    htop \
    wget \
    python3 \
    python3-pip

# Install Tidal-dl:
RUN pip3 install tidal-dl --upgrade

ENV HOME /root
WORKDIR /root

VOLUME ["/dl"]
VOLUME ["/config"]
CMD ["bash"]