% 初始控制器参数
initial_params = [10.2345, 2.3318, 11.1317, 394.7569, 165.8386, 636.8378];
% 初始kp和kd值

% 定义偏移量范围
delta = [10, 5, 10, 100, 50, 200];  % 每个参数的变化范围

% 上下限基于初始值加上和减去偏移量
lb = initial_params - delta;  % 下限
ub = initial_params + delta;  % 上限

% 遗传算法参数设置
options = optimoptions('ga', ...
    'Display', 'iter', ...           % 显示每代优化信息
    'PopulationSize', 6, ...        % 种群大小
    'MaxGenerations', 100, ...       % 最大迭代数
    'FunctionTolerance', 1e-6, ...   % 收敛容差
    'PlotFcn', @gaplotbestf, ...     % 绘制适应度变化
    'InitialPopulation', repmat(initial_params, 6, 1));  % 初始种群设置

% 调用遗传算法
[x_opt, fval] = ga(@pd_fitness, 6, [], [], [], [], lb, ub, [], options);

% 输出优化结果
disp('优化得到的参数：');
disp(['kxp = ', num2str(x_opt(1))]);
disp(['kyp = ', num2str(x_opt(2))]);
disp(['kzp = ', num2str(x_opt(3))]);
disp(['kxd = ', num2str(x_opt(4))]);
disp(['kyd = ', num2str(x_opt(5))]);
disp(['kzd = ', num2str(x_opt(6))]);
disp(['最小代价（IAE）：', num2str(fval)]);