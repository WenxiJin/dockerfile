# This is a comment
FROM ubuntu:14.04
MAINTAINER Wenxi Jin <jwenxi@gmail.com>

# add-apt-repository
RUN apt-get update && apt-get install -y software-properties-common

# wget
RUN apt-get install -y wget

# git
RUN add-apt-repository ppa:git-core/ppa && apt-get update && apt-get install -y git
# config git
RUN git config --global user.name "Wenxi Jin"
RUN git config --global user.email "jwenxi@gmail.com"

# subversion
RUN apt-get install -y subversion

# emacs
# Cannot omit prompt
# RUN apt-get build-dep -y emacs24
#
RUN apt-get install -y libgtk2.0-dev
RUN apt-get install -y libxpm-dev libjpeg-dev libgif-dev libtiff4-dev
RUN apt-get install -y libncurses-dev
RUN cd /usr/src/ && wget http://ftpmirror.gnu.org/emacs/emacs-25.1.tar.xz && tar -xf emacs-25.1.tar.xz && cd emacs-25.1 && ls -la && ./configure && make && make install
RUN ln -sfn /usr/local/bin/emacs-25.1 /usr/local/bin/emacs

# spacemacs
RUN git clone https://github.com/syl20bnr/spacemacs.git .emacs.d
# personal spacemacs config
RUN git clone https://github.com/WenxiJin/.spacemacs.d.git

# ruby
RUN apt-get install -y ruby ruby-dev build-essential
RUN gem install fpm

# java
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk

# junit
RUN apt-get install -y junit

# ant
RUN apt-get install -y ant

# authbind
RUN apt-get install -y authbind

# python
RUN add-apt-repository ppa:fkrull/deadsnakes
RUN apt-get update
RUN apt-get install -y python2.7

# python packages
RUN apt-get install -y python-serial
RUN apt-get install -y python-easygui
RUN apt-get install -y python-pip
RUN pip install -U pip
RUN pip install sh
RUN apt-get install -y python-dev libmysqlclient-dev
RUN pip install MySQL-python

RUN cd /usr/src
RUN wget https://dev.mysql.com/get/Downloads/Connector-Python/mysql-connector-python_2.1.3-1ubuntu15.04_all.deb
RUN dpkg -i mysql-connector-python_2.1.3-1ubuntu15.04_all.deb
