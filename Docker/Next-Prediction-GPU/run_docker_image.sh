#/bin/bash

docker run --gpus all -it -v $(pwd)/../..:/src  --rm tensorflow/tensorflow:Next-Prediction-GPU bash


