%To be commented later -Eric
%Drivers have been added

% variables
%%
jumpCount = 0;
jumpDel = 20;
numberOfData = 500;  %how many points to plot
n = numberOfData; %for shorthand
data_Accel = zeros(1, numberOfData);  %accel data array
sampFreq = 80;
t = (0:1/sampFreq:(numberOfData-1)/sampFreq);
%accel normalization constants
y0g = 0;
y1g = 2720;

accelRes = 4;   %Acceleration reounded to 4 decimal places when normalizing
y1g_inv = 1/y1g;
y1g_inv = round(y1g_inv*10^accelRes)/10^accelRes;
%Target accel
%Corrections to V are made until within yTarget+-yTriggerMin
%Corrections rate is limited at yTarget +- yCorrectionMax
%%
yTarget = getappdata(gui, 'accel_Field');
yError = 0;
% dataE = zeros(1, numberOfData);
yErrorMag = 0;
yTriggerMin = 0.050; %Minimum error to trigger correction
yCorrectionMax = 1.15; %Maximum errr correction, to avoid large correction from noise
yCorrection = 0;

yToVoltConst = .005/8; %convert yCorrection to vCorrection
corrPower = 1;  %Power of correction e.g. Linear(1), Square(2), Cube(3)
%%
fg1Freq = 80;
fg1Volt = 0.100;
fg1VCorrection = 0;
fg1VMax = 1.1;
fg1VMin = 0.050;
fgCount = 0;

%%
%more arrays
prerecordCount = 0;
n_prerecord = 100; % number to finish collecting before corrections
data_fg1Volt = zeros(1,numberOfData); %fg1 Voltages %unit = Vpp
data_Error = zeros(1,numberOfData); %difference from expected Value %unit = g
%
req_fit = 8; %Percent fit_MA required for a big jump %unit = %
n_MA_fit = 15; %number of points in moving average for fit
data_fit = zeros(1, numberOfData); %Absolute Perfect of difference from previous accel %unit = %
data_fit_MA = zeros(1, numberOfData); %unit = %
%
req_K_AV_fit = 1; %Percent required in K_AV_fit_MA
n_timeDelay = 1; %sampled delayed between voltage and accel
n_MA_K_AV = 10; %number of points in moving average for K_AV
data_K_AV = zeros(1, numberOfData); %ratio acceleration to Voltage %unit = g/Vpp
data_K_AV_MA = zeros(1, numberOfData); %moving average %unit = g/Vpp
data_K_AV_fit = zeros(1, numberOfData); %how well each point fit to its MA %unit = %
%This is the value that decides if the K_AV_MA is suitable
data_K_AV_fit_MA = zeros(1, numberOfData); %MA of fit to MA %unit = %
              


