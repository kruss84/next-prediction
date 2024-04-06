#/bin/bash

#docker run --gpus all -it -v $(pwd)/../..:/src  --rm tensorflow/tensorflow:TensorFlow_GPU bash 

docker run --gpus all -it -v /media/eki/datasets6/VIRAT/next-prediction/:/src/next-prediction --rm tensorflow/tensorflow:Next-Prediction-Stage5 bash #\
#python step5_person_appearance.py traj_2.5fps/ anno_person_box/ actev_all_video_frames Object_Detection_Tracking/obj_v3_model/ person_appearance_features person_boxkey2id.p --imgh 1080 --imgw 1920 --person_h 9 --person_w 5 --gpuid 0




