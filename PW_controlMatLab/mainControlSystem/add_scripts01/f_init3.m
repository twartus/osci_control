%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Premake a Plot %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(modes.plotting == 1)
    figure(1);
    
    subplot(2,1,1);                 %Plot Accelerations
    plot1 = plot(t,datas.Accel);           %Plot
    axis([0,datas.n/sampFreq,0,6]);    %-0.5 to 4
    grid('on');
    title('accel')
    xlabel('time(s)');
    ylabel('peak accel (g)');
    hold('on');                 %lines
    p1_lines(11) = plot([0 t(n)],[yAccel.Target, yAccel.Target], 'g');
    p1_lines(12) = plot([0 t(n)],[yAccel.Target + yAccel.TriggerMin, yAccel.Target + yAccel.TriggerMin], 'c', 'LineStyle','--');
    p1_lines(13) = plot([0 t(n)],[yAccel.Target - yAccel.TriggerMin, yAccel.Target - yAccel.TriggerMin], 'c', 'LineStyle','--');
    legend('accel', 'target', 'upperTrigger', 'bottomTrigger');
    hold('off');
    
    
    
    subplot(2,1,2);                 %Plot Errors (something else later)
    plot2 = plot(t,datas.Error);  %Plot
    title('error');
    axis([0,datas.n/sampFreq,-2,2]);
    grid('on')
    xlabel('time(s)');
    ylabel('something (btu)');
    
                                %limits, threshholds, etc
    hold('on');                 %lines
    p1_lines(21) = plot([0 t(n)],[yAccel.TriggerMin, yAccel.TriggerMin], 'c', 'LineStyle','--');
    p1_lines(22) = plot([0 t(n)],[-1 * yAccel.TriggerMin, -1 * yAccel.TriggerMin], 'c', 'LineStyle','--');
    legend('error', 'bottomTrigger', 'topTrigger');
    hold('off');
    drawnow;
end;


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Open Arduino and FG Objects %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
delete(instrfindall);   %clearing
%  clear all; clc; close all;
%Initialize Arduino on serial
arduino1 = serial('COM4','BaudRate',115200);  
%set(s, ' Terminator', 'LF'); % Default terminator is \n
set(arduino1,'BaudRate', 115200);
set(arduino1,'DataBits', 8);
set(arduino1,'StopBits', 1);
fopen(arduino1);
arduino1.ReadAsyncMode = 'continuous';
fwrite(arduino1,'w'); %tell to wake up

%%
if(modes.voltControl == 1);
% Initialize Function Generator on gpib
    functionGen1 = gpib('AGILENT', 7, 10);
    fopen(functionGen1);
    
    %retrieve nowvoltage
    fg1.nowVoltage = f_voltRead(functionGen1);
    fg1.Volt = fg1.nowVoltage;
end;
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Set the Function generator %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(modes.initializeFG == 1)   %initialize if initMode >0
    fprintf(functionGen1,sprintf('VOLT %d', fg1.Volt));
    fprintf(functionGen1,sprintf('FREQ %d', fg1.Freq));
end;
%%begin reading arduino data
readasync(arduino1);

%% Initialize Filter
[filt_num, filt_den] = butter(2, 0.1);