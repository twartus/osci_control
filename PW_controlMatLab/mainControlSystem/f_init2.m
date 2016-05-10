%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Premake a Plot %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(mode_plotting == 1)
    figure(1);
    
    subplot(2,1,1);                 %Plot Accelerations
    plot1 = plot(t,data);           %Plot
    axis([0,numberOfData/sampFreq,-0.5,4]);    %-0.5 to 4
    grid('on');
    title('accel')
    xlabel('time(s)');
    ylabel('peak accel (g)');

    subplot(2,1,2);                 %Plot Errors (something else later)
    plot2 = plot(t,fg1VCorrArray);  %Plot
    title('error');
    axis([0,numberOfData/sampFreq,-1,1]);
    grid('on')
    xlabel('time(s)');
    ylabel('something (btu)');
    drawnow;
end;

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

%%
if(mode_voltControl == 1);
% Initialize Function Generator on gpib
    functionGen1 = gpib('AGILENT', 7, 10);
    fopen(functionGen1);
end;
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