FROM ubuntu:18.04
MAINTAINER Jadson Lourenço <jadsonlourenco@gmail.com>
LABEL Description="Mongodb cron backup to Google Cloud Storage (GCE)"

RUN apt-get update && \
  apt-get install -y software-properties-common curl wget

RUN wget https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/4.1/multiverse/binary-amd64/mongodb-org-unstable-shell_4.1.6_amd64.deb -P /tmp && \
    wget https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/4.1/multiverse/binary-amd64/mongodb-org-unstable-tools_4.1.6_amd64.deb -P /tmp && \
    dpkg -i /tmp/mongodb-org-unstable-shell_4.1.6_amd64.deb && dpkg -i /tmp/mongodb-org-unstable-tools_4.1.6_amd64.deb

#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
#  echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
#  echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \
#RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv E162F504A20CDF15827F718D4B7C549A058F8B6B && \
#  echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org-unstable/4.1.6 multiverse" | tee "/etc/apt/sources.list.d/mongodb-org-unstable.list" && \
#  apt-get update && \
#  apt-get install -y mongodb-org

#RUN add-apt-repository ppa:fkrull/deadsnakes && \
#  apt-get update && \
#  apt-get install -y python3.5 mercurial && \
RUN  apt-get install -y mercurial && \
  apt-get install -y python-pip

RUN apt-get install wget && \
  wget https://bitbucket.org/dbenamy/devcron/get/5d2a470.tar.gz && \
  pip install 5d2a470.tar.gz && \
  rm -rf 5d2a470.tar.gz

RUN mkdir /cron && \
    echo "* * * * * /cron/sample.sh" > /cron/crontab && \
    echo "echo hello world" > /cron/sample.sh && \
    chmod a+x /cron/sample.sh

RUN curl -s -O https://storage.googleapis.com/pub/gsutil.tar.gz && \
  tar xfz gsutil.tar.gz -C $HOME && \
  chmod 777 /root/gsutil && chmod 777 /root/gsutil/* && \
  rm gsutil.tar.gz

ENV CRON_TIME "0 1 * * *"

COPY ./send-notification.sh /
RUN chmod +x /send-notification.sh

COPY ./mongo-commands.js /
RUN chmod +x /mongo-commands.js

COPY ./mongodb-backup.sh /
RUN chmod +x /mongodb-backup.sh

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
