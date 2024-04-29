FROM nvidia/cuda:11.6.2-base-ubuntu20.04

# Install needed packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl git git-lfs python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN git lfs install

# Make python3 default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

COPY ./requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt

#RUN mkdir src
RUN mkdir notebook
RUN mkdir data