FROM jenkins/jenkins

USER root

RUN apt update -y

RUN apt install software-properties-common -y

RUN apt-get install python3-distutils -y

RUN apt -y install python3

RUN curl -O https://bootstrap.pypa.io/get-pip.py

RUN python3 get-pip.py

RUN pip3 install ansible --upgrade

USER jenkins
