clear
clc
%% 常值初始条件
I = [1759 0 0; 0 2758 0; 0 0 2171];  % 航天器转动惯量矩阵

%% 积分初值（积分器中使用）
Euler0 = [4*pi/180, 3*pi/180, 2*pi/180];  % 欧拉角初始值（以弧度表示）
qZYX = eul2quat(Euler0);  % 将欧拉角转换为四元数
w0 = [0; 0; 0];  % 角速度初始值
H0 = [30; 30; 30];  % 飞轮转动惯量初始值

% 控制增益参数
% kxp = 10.2435;  % x轴比例控制增益
% kyp = 2.3318;   % y轴比例控制增益
% kzp = 11.1317;  % z轴比例控制增益
% 
% kxd = 394.7569; % x轴微分控制增益
% kyd = 165.8386; % y轴微分控制增益
% kzd = 636.8378; % z轴微分控制增益

kxp = 18.1115;
kyp = 7.3074;
kzp = 21.1317;
kxd = 395.4913;
kyd = 172.6452;
kzd = 636.1855;

out = sim("attitude_control.slx");
result_show(out); % normal

out_bp = sim("bp_attitude_control.slx");
pd_show(out_bp); % bp
result_show(out_bp); %"bp"





