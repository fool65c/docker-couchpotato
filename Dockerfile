from ubuntu:16.04

RUN apt-get update

# install get
RUN apt-get install -y git-core

# clone couch potato server
RUN cd /usr/local && \
	git clone https://github.com/CouchPotato/CouchPotatoServer.git

# install python
RUN apt-get install -y python

# Clean up
RUN apt-get -y autoremove && \
  apt-get -y clean
RUN rm -rf /var/lib/apt/lists/*

# create couchpotato user
RUN useradd --system --uid 1000 -M --shell /usr/sbin/nologin couchpotato

# create directories
RUN mkdir /config
RUN chown couchpotato /config
RUN mkdir /app_data
RUN chown couchpotato /app_data
RUN mkdir /data
RUN chown couchpotato /data

#run 
USER couchpotato

CMD ["python", "/usr/local/CouchPotatoServer/CouchPotato.py", "--data_dir", "/app_data", "--config_file=/config/CouchPotato.cfg", "--console_log"]