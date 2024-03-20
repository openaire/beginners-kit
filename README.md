# OpenAIRE Graph Beginner's Kit

This beginner's kit runs entirely in a Docker container so as to minimise the effort required to get started and the amount of software packages and frameworks to be installed.
Docker Engine is the only piece of software required.


# Prerequisites
Install Docker Engine from https://www.docker.com.

Please, double-check that Docker has been given an adequate space for containers by checking under Settings -> Resources -> Virtual Disk limit. In our tests, we set this parameter to **64 GB**.
For the sake of completeness, our default configuration was set to 8 CPUs, 8 GB memory, and 1 GB swap.


# How to build
First, `git clone` this repository, then open a Terminal window and get inside the cloned folder.

Once you are in position, run the following command

```
docker build --rm -t openaire-beginners-kit .
```

This will take care of everything is needed to create a Docker image; do not worry, building the image will take some time as Docker needs to fetch plenty of dependencies and try to virtualise an entire Apache Hadoop/Spark cluster on your local workstation.
At the end, you will have a sandboxed environment with Python, Jupyter notebooks, Pandas, Hadoop, Spark and another bunch of modules installed. Easy peasy.


# How to run/stop the container
In order to **start** the container, open Docker Engine, locate the Docker image you just built and run it by clicking the Play icon (►), having care of specifying the port `8889` in the proper field.
You can also provide Docker with a name for the container, e.g., `kit-container`.

You can run the container from the Terminal too with the following command

```
docker run --name kit-container -p 8889:8889 --rm openaire-beginners-kit
```

In order to stop the container, head back to Docker Engine, locate the running container and click on the Stop icon (&#9632;) in order to stop it. 

You can **stop** the container from the Terminal too with the following command

```
docker stop kit-container
```

Later, you can go again to Docker Engine to **restart** the container by clicking the Play icon (►). This will resume the container as you left it (data included).

You can resume the container from the Terminal with the command

```
docker restart kit-container
```


# Playing with the beginner's kit
To start playing with OpenAIRE data, you need to head to JupiterLab and locate the Jupyter notebook we prepared.

Upon starting the container you should see a bunch of logs.
Locate a line containing something like `http://127.0.0.1:8889/lab?token=...`; that's our guy, click on it.
The browser will open a page with JupyterLab.

Open the notebook `beginners_kit.ipynb`; this is where you can start playing with the OpenAIRE Graph.
Just follow the instructions provided in there.

