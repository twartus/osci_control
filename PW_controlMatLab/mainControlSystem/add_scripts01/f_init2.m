%There are alot of plots
counts.forPlot = 0;
if((modes.plotting == 1) && (modes.plotting_extra == 1))
    figure(2);
    %%
    %p2_1
    subplot(4,2,1);                 %Plot Accelerations
    p2_1 = plot(t,datas.fg1Volt);           %Plot
    axis([0,datas.n/sampFreq,0,1.2]);    
    grid('on');
    title('Voltage')
    xlabel('time(s)');
    ylabel('Voltage(Vpp)');
    
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
    title('Accel Error MA');
    axis([0,datas.n/sampFreq,-2,2]);
    grid('on')
    xlabel('time(s)');
    ylabel('Error (t)');
    drawnow;
    %%
    %p2_4
    subplot(4,2,4);                 
    p2_4 = plot(t,datas.fit_MA);  %Plot
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
    p2_6 = plot(t,datas.K_AV_MA);  %Plot
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
    title('K_AV fit MA (%)');
    axis([0,datas.n/sampFreq,0,25]);
    grid('on')
    xlabel('time(s)');
    ylabel('K_AV fit MA (%)');
    drawnow;    
    
    
end;