import os
import torch
import numpy as np

from src.crowd_count import CrowdCounter
from src import network
from src.data_loader import ImageDataLoader
from src import utils
import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)


torch.backends.cudnn.enabled = True
torch.backends.cudnn.benchmark = False
vis = False
save_output = False

data_path =  './data/frames/'
gt_path = './data/original/shanghaitech/part_A_final/test_data/ground_truth_csv/'
model_path = './final_models/mcnn_shtechB_110.h5'


net = CrowdCounter()

trained_model = os.path.join(model_path)
network.load_net(trained_model, net)
net.eval()


#load test data
data_loader = ImageDataLoader(data_path, gt_path, shuffle=False, gt_downsample=True, pre_load=True)

for blob in data_loader:
    im_data = blob['data']
    gt_data = blob['gt_density']
    density_map = net(im_data, gt_data)
    density_map = density_map.data.cpu().numpy()
    # gt_count = np.sum(gt_data)
    et_count = np.sum(density_map)
    print et_count