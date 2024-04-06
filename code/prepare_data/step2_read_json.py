# coding=utf-8
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

"""Given annotation path and filelst, get object/traj/activity annotations."""

# pylint: disable=g-importing-member
# pylint: disable=g-bad-import-order
import argparse
import os
import operator
#import cPickle as pickle
import pickle
import yaml
import json
from tqdm import tqdm
from utils import activity2id
from utils import object2id
from utils import valid_box
from utils import modify_box
from utils import get_traj_point
from utils import actev_scene2imgsize
from utils import get_scene

parser = argparse.ArgumentParser()
parser.add_argument("filelst")
parser.add_argument("anno_path")
parser.add_argument("out_path")

# For running parallel jobs, set --job 4 --curJob k, where k=1/2/3/4
parser.add_argument("--job", type=int, default=1, help="total job")
parser.add_argument("--curJob", type=int, default=1,
                    help="this script run job Num")

scene2imgsize = actev_scene2imgsize

def write_dict_to_file(data, filename):
    with open(filename, 'w') as f:
        json.dump(data, f)

def read_dict_from_file(filename):
    with open(filename, 'r') as f:
        data = json.load(f)
        return data


# Funktion zum Umwandeln aller Schlüssel von String zu Integer
def convert_keys_to_int(d):
    new_dict = {}
    for key, value in d.items():
        new_key = int(key)
        new_dict[new_key] = value
    return new_dict

if __name__ == "__main__":
  args = parser.parse_args()

  video_filenames = [line.strip() for line in open(args.filelst).readlines()]

  if not os.path.exists(args.out_path):
    os.makedirs(args.out_path)

  count = 0
  for video_filename in tqdm(video_filenames):
    count += 1
    if (count % args.job) != (args.curJob - 1):
      continue

    scene = get_scene(video_filename)
    imgsize = scene2imgsize[scene]

    json_file = os.path.join(args.anno_path, video_filename + ".json")

    anno = read_dict_from_file(json_file)

    anno["person_tracks"] = convert_keys_to_int(anno["person_tracks"])
    anno["frameidx2boxes"] = convert_keys_to_int(anno["frameidx2boxes"])
    anno["personid2acts"] = convert_keys_to_int(anno["personid2acts"])
    print(anno["person_tracks"])
    target_file = os.path.join(args.out_path, "%s_test.npz" % (video_filename))
    with open(target_file, "wb") as fw:
      pickle.dump(anno, fw)
    break
