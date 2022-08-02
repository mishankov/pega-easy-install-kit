FROM pegasystems/postgres-pljava-openjdk:11

COPY init_pega.sql docker-entrypoint-initdb.d/
COPY entrypoint-wrapper.sh /

RUN chmod +x /entrypoint-wrapper.sh
ENTRYPOINT ["/entrypoint-wrapper.sh"]

CMD ["postgres", "-c", "logging_collector=on", "-c", "log_directory=/logs", "-c", "log_filename=postgresql.log"]
