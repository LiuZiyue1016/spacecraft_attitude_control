function result_show(out)

    angle = squeeze(out.angle)';
    figure;
    plot(angle(:,1), 'r', 'LineWidth', 1.5); hold on;
    plot(angle(:,2), 'g', 'LineWidth', 1.5);
    plot(angle(:,3), 'b', 'LineWidth', 1.5);
    xlabel('时间 (秒)');
    ylabel('欧拉角 (弧度)');
    legend("滚转角", "俯仰角", "偏转角")
    grid on;
end