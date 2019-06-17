FROM postgres:11

COPY ./initdb.sh /docker-entrypoint-initdb.d/
COPY ./pg_hba.conf /

COPY ./server.key /server.key
COPY ./server.crt /server.crt

RUN chmod 600 /server.key && \
    chown postgres:postgres /server.key