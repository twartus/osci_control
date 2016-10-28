%There are alot of plots
counts.forPlot = 0;
if((modes.plotting == 1) && (modes.plotting_extra == 1))
    fig2 = figure(2);
    clear('fig2');
    fig2 = figure(2);
    %%
    %p2_1
    subplot(4,2,1);                 %Plot Accelerations
    p2_1 = plot(t,datas.fg1Volt);           %Plot
    axis([0,datas.n/sampFreq,0,1.2]);    
    grid('on');
    title('Voltage')
    xlabel('time(s)');
    ylabel('Voltage(Vpp)');
    
    hold('on');                 %lines

    p2_lines(11) = plot([0 t(n)],[fg1.VMax fg1.VMax], 'r', 'LineStyle','--');
    p2_lines(12) = plot([0 t(n)],[fg1.VMin fg1.VMin], 'r', 'LineStyle','--');
    legend('accel', 'upperVoltage', 'lowerVoltage');
    hold('off');
    
    
    
    %%
    %p2_2
    subplot(4,2,2);                
    p2_2 = plot(t,datas.Error);  %Plot
    title('Accel Error');
    axis([0,datas.n/sampFreq,-2,2]);
    grid('on')
    xlabel('time(s)');
    ylabel('Accel (g)');
    drawnow;
    %%
    %p2_3
    subplot(4,2,3);                
    p2_3 = plot(t,datas.Error_MA);  %Plot
    
    hold('on');                 %lines
    p2_lines(31) = plot([0 t(n)],[yAccel.TriggerMin, yAccel.TriggerMin], 'c', 'LineStyle','--');
    p2_lines(32) = plot([0 t(n)],[-1 * yAccel.TriggerMin, -1 * yAccel.TriggerMin], 'c', 'LineStyle','--');
    legend('error', 'bottomTrigger', 'topTrigger');
    hold('off');
    
    
    title('Accel Error MA');
    axis([0,datas.n/sampFreq,-2,2]);
    grid('on')
    xlabel('time(s)');
    ylabel('Error (g)');
    drawnow;
    %%
    %p2_4
    subplot(4,2,4);                 
    p2_4 = plot(t,datas.fit_MA);  %Plot
    
    hold('on');
    p2_lines(41) = plot([0 t(n)],[dataSettings.req_fit, dataSettings.req_fit], 'c', 'LineStyle', '--');
    legend('data','threshhold');
    hold('off');
    
    
    title('Accel fit MA %');
    axis([0,datas.n/sampFreq,0,25]);
    grid('on')
    xlabel('time(s)');
    ylabel('Fit (%)');
    drawnow;
    %%
    %p2_5
    subplot(4,2,5);                
    p2_5 = plot(t,datas.K_AV);  %Plot
    title('K_AV (Ratio Accel to Voltage)');
    axis([0,datas.n/sampFreq,0,10]);
    grid('on')
    xlabel('time(s)');
    ylabel('K_AV (g/Vpp)');
    drawnow;
    %%
    %p2_6
    subplot(4,2,6);                 
    p2_6 = plot(t,datas.K_AV_MA,'b');  %Plot
    
    hold('on');
    p2_lines(61) = plot([0 t(n)],[dataSettings.kavUpperLimJump, dataSettings.kavUpperLimJump], 'c', 'LineStyle', '--');
    p2_lines(62) = plot([0 t(n)],[dataSettings.noLid_K_AV, dataSettings.noLid_K_AV], 'g', 'LineStyle', '--');
    p2_lines(63) = plot([0 t(n)],[dataSettings.kavLowerLimJump, dataSettings.kavLowerLimJump], 'c', 'LineStyle', '--');
    legend('data','upperJumpLimit', 'typicalNoLid', 'lowerJumpLimit');
    hold('off');
    
    
    title('K_AV_MA (Moving Average)');
    axis([0,datas.n/sampFreq,0,10]);
    grid('on')
    xlabel('time(s)');
    ylabel('K_AV_MA (g/Vpp)');
    drawnow;
    %%
    %p2_7
    subplot(4,2,7);                 
    p2_7 = plot(t,datas.K_AV_fit);  %Plot
    title('K_AV fit (%)');
    axis([0,datas.n/sampFreq,0,25]);
    grid('on')
    xlabel('time(s)');
    ylabel('K_AV fit (%)');
    drawnow;
    %%
    %p2_8
    subplot(4,2,8);                 
    p2_8 = plot(t,datas.K_AV_fit_MA);  %Plot
    hold('on');
    p2_lines(8) = plot([0 t(n)],[dataSettings.req_K_AV_fit, dataSettings.req_K_AV_fit], 'c');
    legend('data','threshhold');
    hold('off');
    title('K_AV fit MA (%)');
    axis([0,datas.n/sampFreq,0,25]);
    grid('on')
    xlabel('time(s)');
    ylabel('K_AV fit MA (%)');
    
    drawnow;    
    
    
end;