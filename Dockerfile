FROM bitnami/python:3.10-prod
LABEL maintainer "Grega Vrbančič <grega.vrbancic@gmail.com>"

WORKDIR /mlflow

ARG MLFLOW_VERSION=2.5.0

RUN apt-get update && \
    apt-get -y install --no-install-recommends default-libmysqlclient-dev libpq-dev build-essential && \
    pip install \
    mlflow==$MLFLOW_VERSION \
    sqlalchemy \
    boto3 \
    google-cloud-storage \
    psycopg2 \
    mysql

RUN wget -q https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x wait-for-it.sh

RUN export LC_ALL=C.UTF-8 && export LANG=C.UTF-8

EXPOSE 5000

ENV MLFLOW_BASIC_AUTH_USERNAME=admin
ENV MLFLOW_BASIC_AUTH_USERNAME=password
ENV DB_HOST localhost
ENV DB_PORT 5432
ENV DB_NAME db
ENV DB_USER postgres
ENV DB_PASSWD postgres
ENV ARTIFACT_ROOT /mlflow/mlflow-artifacts
ENV HOST 0.0.0.0

# mlflow db upgrade || true is used for "addressing" the following issue https://github.com/mlflow/mlflow/issues/2444
CMD /bin/bash ./wait-for-it.sh ${DB_HOST}:${DB_PORT} -- mlflow db upgrade postgresql+psycopg2://${DB_USER}:${DB_PASSWD}@${DB_HOST}/${DB_NAME} || true && \
    mlflow server --backend-store-uri postgresql+psycopg2://${DB_USER}:${DB_PASSWD}@${DB_HOST}/${DB_NAME} --default-artifact-root ${ARTIFACT_ROOT} --host ${HOST} --app-name basic-auth
