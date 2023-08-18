
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


# this command is to download the data and set up the requirements
# COMMENT NOT TO DOWNLOAD THE DATA
RUN cd /home/jovyan/openaire && make data 

# UNCOMMENT THE FOLLOWING COMMANDS TO COPY THE DATA FROM LOCAL FOLDER
# the following commands are for downloaded dataset stored in the local folder to be added to the image
# ADD [downloaded_data_folder] /home/jovyan/openaire
# RUN ls /home/jovyan/openaire/data/raw/*.tar | xargs -i tar xf {} -C /home/jovyan/openaire/data/raw/
# RUN cd /home/jovyan/openaire && make requirements 