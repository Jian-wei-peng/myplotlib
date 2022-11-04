close all; clear;

%%
% 1、bag数据包路径 路径：D:\Data\Bag\rosbag.bag 注意不能有中文
% filepath = fullfile('D:', '\Data\Bag', 'rosbag.bag');  % ('根目录', '存储路径', '要读取的bag包名')

% 2、读取bag文件到matlab工作区
% bag = rosbag(filepath);

% 3、选择需要的数据 select
% data = select(bag, 'Topic', '/topic_name'); 
% bag文件选择数据类型
% bagdatatype = select(bagdata,'MessageType','sensor_msgs/JointState');

% 4、读取Topic数据 readMessage
% topicdata = readMessages(data);


%% demo
filepath = fullfile('D:', '\Lab_data\rosbag', 'hat-line.bag');
bag = rosbag(filepath);
mpc_human = select(bag, 'Topic', '/vicon/mpc_human1/mpc_human1');
mpc_human_data = readMessages(mpc_human);
robot_message = select(bag, 'Topic', '/odom');
robot_data = readMessages(robot_message);
% monitor_msg = select(bag, 'Topic', '/monitor');
% monitor_data = readMessages(monitor_msg);


human_trajectory = zeros(3, 3396);
for i = 1 : 3396
    human_trajectory(1, i) = mpc_human_data{i, 1}.Transform.Translation.X;
    human_trajectory(2, i) = mpc_human_data{i, 1}.Transform.Translation.Y;
    human_trajectory(3, i) = mpc_human_data{i, 1}.Transform.Translation.Z;
end

robot_trajectory = zeros(3, 1544);
for i = 1 : 1544
    robot_trajectory(1, i) = robot_data{i, 1}.Pose.Pose.Position.X;
    robot_trajectory(2, i) = robot_data{i, 1}.Pose.Pose.Position.Y;
    robot_trajectory(3, i) = robot_data{i, 1}.Pose.Pose.Position.Z;
end

figure(1)
plot3(human_trajectory(1, 1:700), human_trajectory(2, 1:700), human_trajectory(3, 1:700), ...
     '-', 'Color', [0.9 0.09 0.05], 'LineWidth', 2)
hold on;

plot3(robot_trajectory(1, 1:700), robot_trajectory(2, 1:700), robot_trajectory(3, 1:700), ...
     '--', 'Color', [0.5 0.0 0.0], 'LineWidth', 2)
hold on;



