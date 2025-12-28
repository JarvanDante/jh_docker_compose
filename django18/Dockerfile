FROM centos:centos7
WORKDIR /var/www/html
#RUN yum install -y openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel
RUN yum -y install gcc-c++ automake autoconf libtool make libc6-dev
RUN yum install -y wget vim net-tools psmisc mysql-devel python-devel
COPY get-pip.py /usr/local/
RUN python /usr/local/get-pip.py 
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
###############
#RUN pip install django
#RUN pip install mysqlclient
#RUN yum -y install openssh-server passwd
#ADD ./start.sh /start.sh
#RUN mkdir /var/run/sshd
#RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
#RUN chmod 755 /start.sh
#RUN /start.sh
#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
#RUN pip install django-import-export
#RUN cd /var/www/html/kg_partners_kpi && pip install -r requirements.txt
