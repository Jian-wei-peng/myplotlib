close all; clear;

filepath = fullfile('磁盘名', '\02_MatlabWorkspace\yadan (存储目录)', '0915.bag (bag包名)');

bag = rosbag(filepath);

human_position_message = select(bag, 'Topic', '/vicon/label/label'); % 选择需要的数据