FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip wget unzip -y
RUN wget -O /var/www/html/makaan.zip https://www.free-css.com/assets/files/free-css-templates/download/page295/makaan.zip
WORKDIR /var/www/html
CMD mkdir app
RUN unzip makaan.zip
RUN cp -rf real-estate-html-template/* . &&\
    rm -rf real-estate-html-template
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
