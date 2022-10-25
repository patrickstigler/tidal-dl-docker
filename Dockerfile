FROM python:3.9.4-buster
RUN mkdir tidal-dl
WORKDIR /tidal-dl
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip3 install tidal-dl --upgrade
EXPOSE 80
WORKDIR /tidal-dl/app
CMD python -m uvicorn main:app --host 0.0.0.0 --port 80