%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Premake a Plot %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(mode_plotting == 1)
    figure(1);
    
    subplot(2,1,1);                 %Plot Accelerations
    plot1 = plot(t,data_Accel);           %Plot
    axis([0,numberOfData/sampFreq,0,6]);    %-0.5 to 4
    grid('on');
    title('accel')
    xlabel('time(s)');
    ylabel('peak accel (g)');

    subplot(2,1,2);                 %Plot Errors (something else later)
    plot2 = plot(t,data_Error);  %Plot
    title('error');
    axis([0,numberOfData/sampFreq,-2,2]);
    grid('on')
    xlabel('time(s)');
    ylabel('something (btu)');
    drawnow;
end;


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Open Arduino and FG Objects %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
delete(instrfindall);   %clearing
%  clear all; clc; close all;
%Initialize Arduino on serial
arduino1 = serial('COM5','BaudRate',115200);  
%set(s, ' Terminator', 'LF'); % Default terminator is \n
set(arduino1,'BaudRate', 115200);
set(arduino1,'DataBits', 8);
set(arduino1,'StopBits', 1);
fopen(arduino1);
arduino1.ReadAsyncMode = 'continuous';
fwrite(arduino1,'w'); %tell to wake up

%%
if(mode_voltControl == 1);
% Initialize Function Generator on gpib
    functionGen1 = gpib('AGILENT', 7, 10);
    fopen(functionGen1);
    
    %retrieve nowvoltage
    f_voltRead;
    fg1Volt = now_fg1_Voltage;
end;
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Set the Function generator %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(mode_initializeFG == 1)   %initialize if initMode >0
    fprintf(functionGen1,sprintf('VOLT %d', fg1Volt));
    fprintf(functionGen1,sprintf('FREQ %d', fg1Freq));
end;
%%begin reading arduino data
readasync(arduino1);

%% Initialize Filter
[filt_num, filt_den] = butter(2, 0.1);