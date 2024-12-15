function pd_show(out)
    kxp = out.kxp;
    kyp = out.kyp;
    kzp = out.kzp;
    kxd = out.kxd;
    kyd = out.kyd;
    kzd = out.kzd;
    
    % 绘制 kp 和 kd
    figure;
    
    % kp 系数
    subplot(2, 1, 1);
    plot(kxp, 'r', 'LineWidth', 1.5); hold on;
    plot(kyp, 'g', 'LineWidth', 1.5);
    plot(kzp, 'b', 'LineWidth', 1.5);
    title('kp 系数');
    xlabel('时间 (秒)');
    ylabel('增益 (kp)');
    legend('kxp', 'kyp', 'kzp');
    grid on;
    
    % kd 系数
    subplot(2, 1, 2);
    plot(kxd, 'r', 'LineWidth', 1.5); hold on;
    plot(kyd, 'g', 'LineWidth', 1.5);
    plot(kzd, 'b', 'LineWidth', 1.5);
    title('kd 系数');
    xlabel('时间 (秒)');
    ylabel('增益 (kd)');
    legend('kxd', 'kyd', 'kzd');
    grid on;
end
   