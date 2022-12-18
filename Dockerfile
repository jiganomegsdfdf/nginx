FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Moscow

RUN apt-get update
RUN apt-get install -y sudo bash net-tools supervisor libatlas-base-dev iputils-ping nginx php-common php-fpm php-mysqli php-cli php-curl php-dom unzip zip
COPY . /system
RUN chmod -R 777 /system
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN chmod +x /system/supervisor.sh

EXPOSE 80/tcp
EXPOSE 80/udp

CMD ["/system/supervisor.sh"]
