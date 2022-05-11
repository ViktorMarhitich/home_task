FROM ubuntu:20.04
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    nginx \
    supervisor \
    git \
    wget \
    default-jdk \
    default-jre \
    dos2unix \
    sed;

RUN apt -y install maven

COPY supervisord.conf /supervisord.conf
COPY default /etc/nginx/sites-available/default
COPY scripts /scripts

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN chmod -R 700 /scripts
RUN git clone https://github.com/spring-projects/spring-petclinic.git
RUN cd spring-petclinic \
    && ./mvnw package 


EXPOSE 80
EXPOSE 8080

CMD /scripts/start & \
    cd spring-petclinic \
    && java -jar target/*.jar