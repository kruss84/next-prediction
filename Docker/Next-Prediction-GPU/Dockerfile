FROM tensorflow/tensorflow:custom-op-gpu-ubuntu16-cuda10.0 AS builder




# Installiere Python 3.6
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.6 \
    python3.6-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Setze Standard-Python auf Python 3.6
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1

# Setze Umgebungsvariable für Python auf Python 3.6
ENV PYTHON=python3.6

#COPY ./cudnn-10.0-linux-x64-v7.5.0.56.tgz ./src/
WORKDIR ./src
#RUN tar -xvf cudnn-10.0-linux-x64-v7.5.0.56.tgz
#RUN sudo cp -vR cuda/include/* /usr/local/cuda/include
#RUN sudo cp -vR cuda/lib64/* /usr/local/cuda/lib64

RUN pip3 install --user tensorflow-gpu==1.15.2
RUN pip3 show tensorflow-gpu
RUN pip3 install tqdm
#RUN sh ./startup.sh

RUN git clone https://github.com/google/next-prediction.git next-prediction
WORKDIR ./next-prediction
RUN bash scripts/download_single_models.sh
