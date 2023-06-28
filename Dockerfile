FROM jupyter/pyspark-notebook:latest

RUN pip install papermill
USER jovyan

RUN mkdir /home/jovyan/openaire
RUN mkdir /home/jovyan/openaire/data
RUN mkdir /home/jovyan/openaire/data/raw

ADD notebooks /home/jovyan/openaire/notebooks
ADD src /home/jovyan/openaire/src
ADD test_environment.py /home/jovyan/openaire/
ADD setup.py /home/jovyan/openaire/
ADD Makefile /home/jovyan/openaire
ADD requirements.txt /home/jovyan/openaire/

