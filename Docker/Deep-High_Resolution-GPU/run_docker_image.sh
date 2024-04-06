#/bin/bash

docker run --gpus all -it -v /media/eki/datasets6/VIRAT/prepare_data/:/workspace/  --shm-size 16G --rm pytorch/pytorch:deep-high-resolution-gpu bash


