FROM eorlbruder/nginx-php
MAINTAINER  David Magnus Henriques <eorlbruder@magnus-henriques.de>

WORKDIR /usr/share/webapps
RUN mkdir ris
ADD . /usr/share/webapps/ris/

RUN ln -s /usr/share/webapps/ris /srv/http/ris
RUN chown -R http:http /usr/share/webapps/ris
RUN chown -R http:http /srv/http

ADD assets/0-nextcloud.conf /etc/nginx/sites-available/0-ris.conf

CMD ["supervisord", "-n"]
