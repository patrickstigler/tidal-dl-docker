
FROM python:3.8.3-slim-buster

RUN pip install -U \
    pip \
    setuptools \
    wheel

WORKDIR /project

RUN useradd -m -r user && \
    chown user /project

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV UMASK=0000
ENV UID=99
ENV GID=100

RUN chown -R ${UID}:${GID} /home/user/
RUN mkdir /download
RUN chown -R user /download
USER user
CMD python -m uvicorn main:app --host 0.0.0.0 --port 80