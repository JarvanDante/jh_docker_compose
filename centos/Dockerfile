FROM centos:centos7
WORKDIR /var/www/html
#RUN yum install -y openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel
RUN yum -y install gcc-c++ automake autoconf libtool make libc6-dev
RUN yum install -y wget vim net-tools psmisc mysql-devel python-devel
COPY get-pip.py /usr/local/
RUN python /usr/local/get-pip.py 
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install django-import-export
RUN yum -y install openssh-server passwd
ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN chmod 755 /start.sh
RUN /start.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
#RUN cd /var/www/html/kg_partners_kpi && pip install -r requirements.txt
#COPY Python-3.5.1.tgz /usr/local/
#RUN tar -zxvf /usr/local/Python-3.5.1.tgz -C /usr/local
#RUN sh /usr/local/Python-3.5.1/configure
#RUN make && make install
#RUN rm -rf /usr/bin/python
#RUN ln -s /usr/local/bin/python3.5 /usr/bin/python
#RUN pip3 install uwsgi
#RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#RUN yum install -y supervisor 
#RUN supervisord -c /etc/supervisord.conf
