
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

USER user

CMD python -m uvicorn main:app --host 0.0.0.0 --port 80