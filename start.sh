#!/bin/bash
[ ! -z "${PHP_HOST}" ]                 && sed -i "s/PHP_HOST/${PHP_HOST}/" /etc/nginx/nginx.conf
[ ! -z "${PHP_PORT}" ]                 && sed -i "s/PHP_PORT/${PHP_PORT}/" /etc/nginx/nginx.conf
[ ! -z "${APP_MAGE_MODE}" ]            && sed -i "s/APP_MAGE_MODE/${APP_MAGE_MODE}/" /etc/nginx/nginx.conf

# determine whether to set the HTTPS fastcgi param
if [ -z "${HTTPS}" ]
then
      # HTTPS env var is not empty or unset
      echo "HTTPS was not specified. Defaulting to 'on'."
      sed -i "s/HTTPS_VALUE/on/" /etc/nginx/nginx.conf
else
      # Pass HTTPS value through
      echo "Passing HTTPS value: ${HTTPS}"
      sed -i "s/HTTPS_VALUE/${HTTPS}/" /etc/nginx/nginx.conf
fi

/usr/sbin/nginx -g "daemon off;"
