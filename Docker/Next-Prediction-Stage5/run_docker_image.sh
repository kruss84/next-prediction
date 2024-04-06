#/bin/bash

docker run --gpus all -it -v $(pwd)/../..:/src/next-prediction  --rm tensorflow/tensorflow:Next-Prediction-GPU bash


