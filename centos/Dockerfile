FROM centos:centos7
RUN yum -y update
RUN yum -y install openssh-server

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

RUN ssh-keygen -A

RUN useradd remote_user && \
    echo "remote_user" | /usr/bin/passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN rm -rf /run/nologin

RUN yum -y install mysql

#RUN yum -y install python39

RUN yum -y install epel-release && \
    yum -y install python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install awscli

CMD /usr/sbin/sshd -D
