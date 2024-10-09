FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip wget unzip -y
RUN wget -O /var/www/html/antique-cafe.zip https://www.free-css.com/assets/files/free-css-templates/download/page295/antique-cafe.zip
WORKDIR /var/www/html
RUN unzip antique-cafe.zip
RUN cp -rf 2126_antique_cafe/* . &&\
    rm -rf 2126_antique_cafe
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
