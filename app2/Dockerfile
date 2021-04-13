FROM php:8.0-apache

# -- If need more init commands - discomment the 2 rows below
#RUN yum update -y && yum install -y initscripts;
#CMD ["/usr/sbin/init"]

RUN apt-get update
RUN apt-get -y install default-mysql-client
RUN docker-php-ext-install pdo \
        mysqli pdo_mysql
RUN echo "<html><h1>This is WebServer 01</h1></html>" > /var/www/html/index.html

COPY php.ini /etc/
COPY httpd.conf /etc/httpd/conf/
COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

COPY allusers.php index.php style.css /var/www/html/

RUN chmod 755 /var/www/html/*
WORKDIR /var/www/html

EXPOSE 80 3306
