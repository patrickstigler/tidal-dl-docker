FROM python:3.9.4-buster
RUN mkdir /home/tidal
WORKDIR /home/tidal

RUN useradd -m -r user && \
    chown -R user /home/tidal
RUN export HOME=/home/tidal

COPY . .
RUN chmod +x /home/tidal/app/main.py
RUN pip install --no-cache-dir -r requirements.txt
RUN pip3 install tidal-dl --upgrade

USER user

EXPOSE 80
CMD python -m uvicorn main:app --host 0.0.0.0 --port 80