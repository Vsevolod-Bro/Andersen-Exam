FROM php:8.0-apache


#RUN yum update -y && yum install -y initscripts;

#CMD ["/usr/sbin/init"]

RUN apt-get update
# && apt-get install -y 

# ip-172-31-100-87.us-west-2.compute.internal
# ;dEdp/p?i0aa


#RUN apt-get install -y php php-fpm php-mysql php-mbstring
#php \
#php-fpm \
#mysql-server \
RUN apt-get -y install default-mysql-client
RUN docker-php-ext-install pdo \
        mysqli pdo_mysql
#RUN apt-get -y install pdo_mysql

#RUN yum install -y epel-release
#RUN yum -y install sudo
#RUN amazon-linux-extras install -y nginx1
#RUN cd /usr/share/nginx/html; 
RUN echo "<html><h1>This is WebServer 01</h1></html>" > /var/www/html/index.html
#RUN amazon-linux-extras -y install php
#RUN yum -y install php-fpm
#RUN cd /var/www/html
#RUN mkdir -p /var/www/html/
#mysql php-mysql
#; yum clean all
#RUN systemctl stop nginx
#RUN systemctl stop httpd
#CMD [ "/etc/init.d/nginx stop" ]
#CMD [ "httpd -s stop" ]
#RUN service php-fpm start
#RUN service nginx start

#RUN adduser -D app1user
COPY php.ini /etc/
COPY httpd.conf /etc/httpd/conf/
COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

COPY allusers.php index.php style.css /var/www/html/
#COPY allusers.php index.php style.css /etc/www/html/
RUN chmod 755 /var/www/html/*
WORKDIR /var/www/html
#CMD [ "nginx" ]
#CMD [ "php-fpm" ]
#RUN systemctl start php-fpm
#RUN systemctl enable php-fpm 
#RUN systemctl start nginx
#RUN systemctl enable nginx

EXPOSE 80 3306
