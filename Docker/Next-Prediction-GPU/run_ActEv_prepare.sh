#/bin/bash

#docker run --gpus all -it -v $(pwd)/../..:/src  --rm tensorflow/tensorflow:TensorFlow_GPU bash 

docker run --gpus all -it -v $(pwd)/../..:/src/next-prediction --rm tensorflow/tensorflow:Next-Prediction-GPU \
	python3 code/preprocess.py next-data/final_annos/actev_annos/virat_2.5fps_resized_allfeature/ \
	  actev_preprocess --obs_len 8 --pred_len 12 --add_kp --kp_path next-data/final_annos/actev_annos/anno_kp/ \
	  --add_scene --scene_feat_path next-data/final_annos/actev_annos/ade20k_out_36_64/ \
	  --scene_map_path next-data/final_annos/actev_annos/anno_scene/ \
	  --scene_id2name next-data/final_annos/actev_annos/scene36_64_id2name_top10.json \
	  --scene_h 36 --scene_w 64 --video_h 1080 --video_w 1920 --add_grid \
	  --add_person_box --person_box_path next-data/final_annos/actev_annos/anno_person_box/ \
	  --add_other_box --other_box_path next-data/final_annos/actev_annos/anno_other_box/ \
	  --add_activity --activity_path next-data/final_annos/actev_annos/anno_activity/ \
	  --person_boxkey2id_p next-data/final_annos/actev_annos/person_boxkey2id.p 



