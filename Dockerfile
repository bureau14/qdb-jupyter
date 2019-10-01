
FROM jupyter/scipy-notebook

USER root

RUN apt install apt-transport-https ca-certificates -y
RUN echo "deb [trusted=yes] https://repo.quasardb.net/apt/ /" > /etc/apt/sources.list.d/quasardb.list
RUN apt update
RUN apt install qdb-api=3.4.1-1 cmake g++ -y
RUN pip install wheel
RUN pip install quasardb
RUN  pip install quandl
RUN pip install papermill[all]
RUN pip install httpie
RUN pip install plotly[all]

ADD ./notebooks-jupyter/ /home/jovyan/work/

RUN fix-permissions /home/jovyan

USER jovyan
WORKDIR    /home/jovyan/work
