FROM centos

RUN yum -y install openssh-server

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

RUN ssh-keygen -A

RUN useradd remote_user && \
    #echo "remote_user" | /usr/bin/passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN rm -rf /run/nologin

RUN yum install -y yum-utils

RUN yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

RUN yum install docker-ce -y

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker remote_user

RUN yum -y install openssh-clients
 
CMD /usr/sbin/sshd -D
