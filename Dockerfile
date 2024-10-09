FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip wget unzip -y
RUN wget -O /var/www/html/finexo.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/listrace.zip
WORKDIR /var/www/html
RUN unzip listrace.zip
RUN cp -rf listrace-html/* . &&\
    rm -rf listrace-html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
