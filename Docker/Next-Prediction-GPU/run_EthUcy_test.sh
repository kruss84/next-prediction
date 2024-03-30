#!/bin/bash
datasets="eth hotel univ zara1 zara2"
for dataset in $datasets
do
    	echo "$dataset"
    	docker run --gpus all -it -v $(pwd)/../..:/src  --rm tensorflow/tensorflow:Next-Prediction-GPU \
    	python3 code/test.py ethucy_exp/preprocess_${dataset} next-models/ethucy_single_model/${dataset}/ model \
   	--runId 1 --load_best --person_feat_path next-data/ethucy_personboxfeat/${dataset}/ \
      	--scene_h 51 --scene_w 64 ;
done
