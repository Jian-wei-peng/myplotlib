%% 标题
sgtitle('The state of human-following robot system');

%% 颜色
% [0.85, 0.33, 0.10]
% [0.93, 0.69, 0.13]
% [0.00, 0.45, 0.74]
% 

%% 添加文本标注
txt = '(0,5)';
text(-1.2, 5.1, txt);
txt = '\theta=-90^o';
text(-0.3, 4.6, txt, Rotation=-85);
txt = '\theta=-45^o';
text(0.6, 4.8, txt, Rotation=-40);
txt = '\theta=30^o';
text(0.8, 5.8, txt, Rotation=0);


%%
figure(1);
plot(humanTraj(1, :), humanTraj(2, :), '-', 'Color', [1 0 0], 'LineWidth', 2);
hold on;
plot(robotPose(1, :), robotPose(2, :), '-', 'Color', [0.5 0.7 0.5], 'LineWidth', 2);
hold on;
axis([-2 14 0 4]); 
set(gcf, 'color', 'w');
title('Trajectory in the XY plane');
xlabel('X [m]');
ylabel('Y [m]');
legend('Human', 'Robot');
grid on;


%% 子图
figure(2);
subplot(3, 1, 1);

subplot(3, 1, 2);

subplot(3, 1, 3);

subplot(3, 1, 3);


%% 多个标注
p1 = plot(humanTraj(1, :), humanTraj(2, :), '-', 'Color', [1 0 0], 'LineWidth', 3);
hold on;
p2 = plot(robotPose_1(1, :), robotPose_1(2, :), '--', 'Color', [0.5, 0.2, 0.2], 'LineWidth', 1.5);
hold on;
p3 = plot(robotPose_2_1(1, :), robotPose_2_1(2, :), '--', 'Color', [0.9, 0.7, 0.1], 'LineWidth', 1.5);
hold on;
legend([p1 p2 p3], {'p1标注', 'p2标注', 'p3标注'}, 'Location', 'northeast');


%% 绘制直线和横线
line([8.8, 8.8], [0.5*pi, 1.5*pi], 'linestyle', '--', 'Color', [0, 0, 0], 'LineWidth', 1);
line([21.8, 21.8], [pi, 1.5*pi], 'linestyle', '--', 'Color', [0, 0, 0], 'LineWidth', 1);
line([33.8, 33.8], [pi, 1.5*pi], 'linestyle', '--', 'Color', [0, 0, 0], 'LineWidth', 1);
line([43.8, 43.8], [0.5*pi, 1.5*pi], 'linestyle', '--', 'Color', [0, 0, 0], 'LineWidth', 1);
line([56.8, 56.8], [0.5*pi, pi], 'linestyle', '--', 'Color', [0, 0, 0], 'LineWidth', 1);


