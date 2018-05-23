FROM python:3.6-stretch

RUN apt-get update && \
    apt-get install -y libmpv-dev
    
ADD https://yt-dl.org/latest/youtube-dl /usr/local/bin/youtube-dl

RUN chmod a+x /usr/local/bin/youtube-dl

ADD . /app
WORKDIR /app

RUN pip3 install --upgrade pip && \
    pip install -r requirements.txt

WORKDIR /app
CMD ["python", "server.py"]