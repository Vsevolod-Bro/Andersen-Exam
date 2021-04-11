FROM centos:8



RUN yum install -y epel-release
RUN yum -y install sudo nginx php mysql php-mysql php-fpm; yum clean all
#RUN systemctl stop nginx
#RUN systemctl stop httpd
RUN nginx -s quit
RUN httpd -k graceful-stop
#RUN service php-fpm start
#RUN service nginx start

#RUN adduser -D app1user
COPY php.ini /etc/
COPY httpd.conf /etc/httpd/conf/
COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/

COPY allusers.php index.php style.css /var/www/html/

RUN sudo nginx
RUN sudo php-fpm
#RUN systemctl start php-fpm
#RUN systemctl enable php-fpm 
#RUN systemctl start nginx
#RUN systemctl enable nginx

EXPOSE 80
