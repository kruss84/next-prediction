#FROM tensorflow/tensorflow:custom-op-gpu-ubuntu16-cuda9.0 AS builder
#FROM tensorflow/tensorflow:custom-op-gpu-ubuntu16 AS builder
#FROM tensorflow/tensorflow:custom-op-gpu-ubuntu14 AS builder

# Verwenden Sie das TensorFlow-Basisimage mit CUDA 9.0 und cuDNN 7
FROM tensorflow/tensorflow:1.10.0-gpu

# Aktualisieren Sie das Paketverzeichnis und installieren Sie TensorFlow GPU 1.10
RUN pip install --user tensorflow-gpu==1.10

# Setze Umgebungsvariable für Python auf Python 3.6

RUN pip show tensorflow-gpu
RUN /usr/bin/python -m pip install --upgrade pip
RUN pip install tqdm  pyyaml #opencv-python opencv-contrib-python #pycocotools


RUN apt-get update && apt-get install -y --no-install-recommends python-dev python-pip python-numpy libsm6 libxext6 libxrender-dev git
RUN pip install opencv-python==3.4.6.27
#RUN pip install Pickle

#RUN pip uninstall cython
#RUN pip install --upgrade cython
RUN pip install git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI


COPY ./startup.sh ./
RUN sh ./startup.sh

#RUN git clone https://github.com/google/next-prediction.git next-prediction
WORKDIR /src/next-prediction

#RUN git clone https://github.com/JunweiLiang/Object_Detection_Tracking
#WORKDIR ./Object_Detection_Tracking/
#RUN git checkout 04f24336a02efb7671760a5e1bacd27141a8617c
#RUN wget --no-check-certificate https://precognition.team/shares/diva_obj_detect_models/models/obj_v3_model.tgz
#RUN tar -zxvf obj_v3_model.tgz
#WORKDIR ../



