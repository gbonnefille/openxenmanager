FROM ubuntu:bionic

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update &&\
    apt-get install -y python2.7 python-gtk2 glade python-gtk-vnc python-glade2 python-configobj python-setuptools python-raven

RUN mkdir -p /opt/openxenmanager
COPY . /opt/openxenmanager
RUN cd /opt/openxenmanager && python setup.py install