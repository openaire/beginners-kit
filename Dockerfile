FROM eclipse-temurin:21

RUN apt-get update && apt-get install -y curl vim wget software-properties-common ssh net-tools ca-certificates python3 python3-pip 

RUN update-alternatives --install "/usr/bin/python" "python" "$(which python3)" 1

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV SPARK_VERSION=3.5.1 \
HADOOP_VERSION=3 \
SPARK_HOME=/opt/spark \
PYTHONHASHSEED=1


# Download and uncompress spark from the apache archive
RUN wget https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz 

RUN mkdir -p /opt/
RUN tar -xf spark-3.5.1-bin-hadoop3.tgz -C /opt/
RUN rm spark-3.5.1-bin-hadoop3.tgz
RUN mv /opt/spark-3.5.1-bin-hadoop3 /opt/spark

COPY log4j2.properties /opt/spark/conf

RUN useradd -d /app -s /bin/bash -G sudo -u 1001  openaire

WORKDIR /app 


RUN chown -R openaire /app

USER openaire

RUN pip install jupyter notebook
COPY requirements.txt .
RUN pip install -r requirements.txt
EXPOSE 8889
RUN pip install jupyter notebook
ENV PATH="$PATH:/opt/spark/bin:/app/.local/bin"
ENV PYSPARK_DRIVER_PYTHON='jupyter'
ENV PYSPARK_DRIVER_PYTHON_OPTS='lab --ip 0.0.0.0 --no-browser --port=8889'


RUN mkdir -p /app/openaire/data/raw

ADD notebooks /app/openaire
USER root
RUN chown -R openaire /app/openaire
USER openaire
WORKDIR /app/openaire
ENTRYPOINT [ "pyspark" ]