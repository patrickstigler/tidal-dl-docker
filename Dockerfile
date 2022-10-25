FROM python:3.9.4-buster
RUN mkdir /tidal
WORKDIR /tidal
RUN export HOME=/tidal
COPY . .
RUN chmod +x /tidal/app/main.py
RUN pip install --no-cache-dir -r requirements.txt
RUN pip3 install tidal-dl --upgrade

EXPOSE 80
CMD python -m uvicorn main:app --host 0.0.0.0 --port 80