Runs a couchpotato server

User couchpotato is id 1000 this is used on all docker containers to keep access simple
```
RUN useradd --system --uid 10000 -M --shell /usr/sbin/nologin couchpotato
```

You must export the Config dir and data dir before running

```bash
 export COUCHPOTATO_CONFIG_DIR=/var/lib/application/couchpotato/config
 export COUCHPOTATO_DATA_DIR=/var/lib/application/couchpotato/data
 export COUCHPOTATO_DOWNLOAD_DIR=/srv/download
 export COUCHPOTATO_MOVIE_DIR=/srv/movies
 ```

 To start run the following
 ```bash
 docker-compose up -d
 ```

 This service is listening on port 10001