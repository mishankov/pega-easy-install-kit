FROM busybox AS builder

COPY ../distr/archives/prweb.war /
RUN mkdir prweb
RUN unzip -q -o prweb.war -d /prweb


FROM pegasystems/pega-ready:2.1.0

ENV JDBC_CLASS=org.postgresql.Driver

ADD --chown=pegauser:root ../libs/postgresql-42.2.14.jar ${CATALINA_HOME}/lib/

COPY --chown=pegauser:root tomcat-users.xml ${CATALINA_HOME}/conf

# Copy prweb to tomcat webapps directory
COPY --chown=pegauser:root --from=builder /prweb ${CATALINA_HOME}/webapps/prweb

RUN chmod -R g+rw ${CATALINA_HOME}/webapps/prweb
RUN chmod g+rw ${CATALINA_HOME}/webapps/prweb/WEB-INF/classes/prconfig.xml
RUN chmod g+rw ${CATALINA_HOME}/webapps/prweb/WEB-INF/classes/prlog4j2.xml