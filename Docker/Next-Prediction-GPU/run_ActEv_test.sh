#/bin/bash

docker run --gpus all -it -v $(pwd)/../..:/src/next-prediction  --rm tensorflow/tensorflow:Next-Prediction-GPU \
python3 code/test.py actev_preprocess next-models/actev_single_model model  \
--runId 1   --load_best --is_actev --add_kp --add_activity   --person_feat_path next-data/actev_personboxfeat --multi_decoder


