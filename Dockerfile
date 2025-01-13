FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Install necessary dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    python3-pip \
    git \
    ffmpeg \
    libsm6 \
    libxext6 \
    wget \
    curl \
    iproute2 \
    iputils-ping \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U --no-cache-dir pip==24.0 setuptools wheel

COPY . /src

RUN pip install --no-cache-dir -r /src/requirements.txt

# Symlink python
RUN ln -n /usr/bin/python3 /usr/bin/python
