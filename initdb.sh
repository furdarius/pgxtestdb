#!/usr/bin/env bash

psql -U postgres -c 'create database pgx_test'
psql -U postgres pgx_test -c 'create extension hstore'
psql -U postgres pgx_test -c 'create domain uint64 as numeric(20,0)'
psql -U postgres -c "create user pgx_ssl SUPERUSER PASSWORD 'secret'"
psql -U postgres -c "create user pgx_md5 SUPERUSER PASSWORD 'secret'"
psql -U postgres -c "create user pgx_pw  SUPERUSER PASSWORD 'secret'"
psql -U postgres -c "create user pgx_replication with replication password 'secret'"
psql -U postgres -c "create user \" tricky, ' } \"\" \\ test user \" superuser password 'secret'"

echo "wal_level='logical'"     >> $PGDATA/postgresql.conf
echo "max_wal_senders=5"       >> $PGDATA/postgresql.conf
echo "max_replication_slots=5" >> $PGDATA/postgresql.conf
echo "ssl=on" >> $PGDATA/postgresql.conf

cp /pg_hba.conf $PGDATA/pg_hba.conf
cp /server.key $PGDATA/server.key
cp /server.crt $PGDATA/server.crt