FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip wget unzip -y
RUN wget -O /var/www/html/oxer.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
WORKDIR /var/www/html
RUN unzip oxer.zip
RUN cp -rf oxer-html/* . &&\
    rm -rf oxer-html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
