FROM nginx:1.15

ENV PHP_HOST phpfpm
ENV PHP_PORT 9000
ENV APP_MAGE_MODE default

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/nginx.mage.conf /etc/nginx/
COPY ./start.sh /usr/local/bin/start.sh

RUN chmod 0755 /usr/local/bin/start.sh

WORKDIR /var/www/html

CMD ["/usr/local/bin/start.sh"]
