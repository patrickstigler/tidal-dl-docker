FROM python:3.9.4-buster
RUN useradd -ms /bin/bash activeuser
USER activeuser
WORKDIR /home/activeuser
RUN mkdir /home/activeuser/tidal-dl
WORKDIR /home/activeuser/tidal-dl
RUN chown activeuser:activeuser /home/activeuser/tidal-dl
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip3 install tidal-dl --upgrade
EXPOSE 80
WORKDIR /tidal-dl/app
CMD python -m uvicorn main:app --host 0.0.0.0 --port 80