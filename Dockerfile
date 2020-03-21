FROM python:3.6-alpine
MAINTAINER Artyom Aleksandrov

RUN apk add --no-cache unzip gcc zlib-dev \
                       libxml2-dev libxslt-dev libffi-dev gcc musl-dev jpeg-dev \
                       freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev
#RUN git clone https://github.com/Flexget/Flexget.git /flexget && \
#ADD https://github.com/Flexget/Flexget/archive/develop.zip /flexget-dev.zip
RUN pip3 install -U pip && pip3 install flexget
#RUN mkdir -p /opt && \
#    unzip /flexget-dev.zip -d /opt/ && \
#   cd /opt/Flexget-develop && \
#    pip3 install -e .
ADD start.sh . 
VOLUME /root/.flexget
#WORKDIR /opt/Flexget-develop
ENTRYPOINT ["/start.sh"]
CMD ["--loglevel", "info", "daemon", "start", "--autoreload-config"] 

