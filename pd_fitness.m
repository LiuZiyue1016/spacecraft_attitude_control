function cost = pd_fitness(x)

    kxp = x(1); kyp = x(2); kzp = x(3);
    kxd = x(4); kyd = x(5); kzd = x(6);
    
    % 将优化参数传递到 Simulink 工作区
    assignin('base', 'kxp', kxp);
    assignin('base', 'kyp', kyp);
    assignin('base', 'kzp', kzp);
    assignin('base', 'kxd', kxd);
    assignin('base', 'kyd', kyd);
    assignin('base', 'kzd', kzd);
    
    % 运行 Simulink 仿真
    out = sim('attitude_control.slx', 'ReturnWorkspaceOutputs', 'on');
    
    % 获取三个角度的误差（假设 angle_x, angle_y, angle_z 是导出的变量）
    angle = squeeze(out.angle)';
    time = out.tout;
    
    % 计算误差的积分（以 IAE 为例）
    error_x = abs(angle(:, 1));
    error_y = abs(angle(:, 2));
    error_z = abs(angle(:, 3));
    
    % 计算总的误差（IAE）
    cost = trapz(time, error_x) + trapz(time, error_y) + trapz(time, error_z);
end