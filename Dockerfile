FROM ubuntu:20.04

RUN apt-get -y update && apt -y install nginx && apt -y install supervisor

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY supervisord.conf /supervisord.conf
COPY index.html /tmp/index.html
COPY 1.jpg /tmp/1.jpg
COPY default /etc/nginx/sites-available/default
COPY scripts /scripts
RUN chmod -R 700 /scripts

EXPOSE 80
EXPOSE 8080
EXPOSE 443

CMD [ "/scripts/start" ]