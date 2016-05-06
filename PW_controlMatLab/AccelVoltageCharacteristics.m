%http://www.mathworks.com/matlabcentral/answers/140532-matlab-plot-multiple-columns-of-data-from-arduino
%http://stackoverflow.com/questions/25718779/arduino-nano-avrdude-ser-opensystem-cant-open-device-com1the-system

%To be commented later -Eric
delete(instrfindall);   %clearing
  clear all; clc; close all;
%Initialize Arduino on serial
arduino1 = serial('COM14','BaudRate',115200);  
%set(s, ' Terminator', 'LF'); % Default terminator is \n
set(arduino1,'BaudRate', 115200);
set(arduino1,'DataBits', 8);
set(arduino1,'StopBits', 1);
fopen(arduino1);
arduino1.ReadAsyncMode = 'continuous';
% Initialize Function Generator on gpib
functionGen1 = gpib('AGILENT', 7, 10);
fopen(functionGen1);
y0g = 508;      %To be Adjust to accurate values -Mar8
y1g = 532;
% variables

numberOfData = 160;  %how many points to plot
N = 1;
accelData = zeros(1, numberOfData);  %accel data array
voltData = zeros(1, numberOfData);
%accel normalization constants


voltMax = 0.8;
voltMin = 0.05;
voltStep = 0.005;
fg1Volt = 0.350;
fg1VCorrection = 0;

%set the function generator V and Freq
fprintf(functionGen1,sprintf('VOLT %d', fg1Volt));
fprintf(functionGen1,sprintf('FREQ %d', fg1Freq));

pause(0.1);

readasync(arduino1);

while(N < numberOfData + 1)
    
    accelData(N) = fscanf(arduino1, '%f');        %Read in New Data   
    accelData(N) = abs((accelData(N)- y1g) / (y0g - y1g));   %normalize
    voltData(N) = fg1Volt;
    
    if((fg1Volt+voltStep) < voltMax)    %if does not pass max, increment
        fg1Volt = fg1Volt + voltStep;
        fprintf(functionGen1,sprintf('VOLT %d', fg1Volt));
    end;
    
end;
figure(1)   %plot accel vs volt
hold('on')
plot(voltData, accelData);
scatter(voltData, accelData);
grid('on')
xlabel('Voltage (V)');
ylabel('Peak Accel (g)');
hold('off');

% Give the external device some time…
pause(3000); %This seems to be bad, 3000 seconds?
return;

% Some of these crash the program – it depends. The serial port is left
% open, which is not good.                                              
stopasync(arduino1);
fclose(arduino1);   % to close
delete(arduino1);   % to delete
fclose(functionGen1);   %to close
delete(functionGen1);   %to delete
clear arduino1;
clear functionGen1;
fprintf(1, 'Sorry, you"re going to have to close out of Matlab to close the serial port\n');
return
