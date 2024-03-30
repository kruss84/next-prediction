#!/bin/bash

datasets="eth hotel univ zara1 zara2"
for dataset in $datasets
do
    	echo "$dataset"
	docker run --gpus all -it -v $(pwd)/../..:/src  --rm tensorflow/tensorflow:Next-Prediction-GPU \
	python3 code/preprocess.py next-data/final_annos/ucyeth_annos/original_trajs/${dataset}/ ethucy_exp/preprocess_${dataset} \
	--person_boxkey2id next-data/final_annos/ucyeth_annos/${dataset}_person_boxkey2id.p \
	--obs_len 8 --pred_len 12 --min_ped 1 --add_scene \
	--scene_feat_path next-data/final_annos/ucyeth_annos/ade20k_e10_51_64/ \
	--scene_map_path next-data/final_annos/ucyeth_annos/scene_feat/ \
	--scene_id2name next-data/final_annos/ucyeth_annos/scene51_64_id2name_top10.json \
	--scene_h 51 --scene_w 64 --video_h 576 --video_w 720 --add_grid --add_person_box \
	--person_box_path next-data/final_annos/ucyeth_annos/person_box/ --add_other_box \
	--other_box_path next-data/final_annos/ucyeth_annos/other_box/ \
	--feature_no_split --reverse_xy --traj_pixel_lst \
	next-data/final_annos/ucyeth_annos/traj_pixels.lst ;
done



