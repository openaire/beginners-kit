# OpenAIRE Graph Beginner's Kit

This beginner's kit runs entirely in a Docker container so as to minimise the effort required to get started and the amount of software packages and frameworks to be installed.
Docker Engine is the only piece of software required.


# Prerequisites
Install Docker Engine from https://www.docker.com


# How to build
First, `git clone` this repository, then open a Terminal window and get inside the cloned folder.

Once you are in position, run the following command

```docker build --rm  -t  openaire-beginners-kit .```

This will take care of everything is needed to create a Docker image. At the end, you will have an environment with Python, Jupyter notebooks, Pandas, Spark and another bunch of modules installed. Easy peasy.


# How to run the container
Open Docker Engine, locate the Docker image you just built and run it, having care of specifying a port (e.g., 8888).
In the log, you should see an URL promped like `https://127.0.0.1:8888/...`; that's our guy, click on it.
The browser will open a page with JupyterLab; this is where you can start playing with the OpenAIRE Graph.

You can run the container from the Terminal too with the following command

```docker run -p 8888:8888  --rm  openaire-beginners-kit```


# How to fetch the data
The data will be downloaded automatically from Zenodo. Each time the docker image is closed, everything part of the image will be lost. If you want to avoid downloading the data each time, you should save them in a local directory and change the Docker following the instructions.


