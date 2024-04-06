#FROM tensorflow/tensorflow:custom-op-gpu-ubuntu16-cuda10.0 AS builder
FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-devel AS builder
#FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-devel AS builder
#FROM pytorch/pytorch:1.4-cuda10.1-cudnn7-devel AS builder

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

RUN apt-get update && apt-get install -y --no-install-recommends python-dev python-pip python-numpy libsm6 libxext6 libxrender-dev git

RUN git clone https://github.com/kruss84/deep-high-resolution-net.pytorch
WORKDIR ./deep-high-resolution-net.pytorch/
RUN pip install -r requirements.txt
WORKDIR ./lib
RUN make
WORKDIR /workspace 
RUN git clone https://github.com/cocodataset/cocoapi.git
WORKDIR cocoapi/PythonAPI
RUN pip install pillow==8.4.0
RUN make install
WORKDIR /workspace
RUN apt install -y --no-install-recommends wget libglib2.0-0
#RUN wget --no-check-certificate https://precognition.team/next/data/072019_prepare_data/pose_hrnet_w48_384x288.pth
#RUN wget --no-check-certificate https://precognition.team/next/data/072019_prepare_data/person_keypoints_val2017.json
