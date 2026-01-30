FROM postgres:9.6
ENV POSTGRES_USER user
ENV POSTGRES_PASSWORD secret
ENV POSTGRES_DB demo
ADD init.sql /docker-entrypoint-initdb.d/init.sql
EXPOSE 5432
ENV TZ=America/La_Paz
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone