function [ counts, datas, dataSettings, fg1, LIS331, n, sampFreq, t, yAccel   ] = f_init1(gui)

%To be commented later -Eric
%Drivers have been added

% variables
%%
datas.n = 500;  %how many points to plot
n = datas.n; %for shorthand
datas.Accel = zeros(1, datas.n);  %accel data array
LIS331.sampFreq = 80;

%accel normalization constants
LIS331.y0g = 0;
LIS331.y1g = 2720;

LIS331.decimals = 4;   %Acceleration reounded to 4 decimal places when normalizing
                        %This is a user defined, not a device constraint
LIS331.y1g_inverted = 1/LIS331.y1g;
LIS331.y1g_inverted = round(LIS331.y1g_inverted*10^LIS331.decimals)/10^LIS331.decimals;

sampFreq = LIS331.sampFreq;
t = (0:1/sampFreq:(datas.n-1)/sampFreq);
%Target accel
%Corrections to V are made until within yTarget+-yTriggerMin
%Corrections rate is limited at yTarget +- yCorrectionMax
%%
yAccel.Target = getappdata(gui, 'accel_Field');
yAccel.Error = 0;
% dataE = zeros(1, datas.n);
yAccel.ErrorMag = 0;
yAccel.TriggerMin = 0.001; %Minimum error to trigger correction
yAccel.CorrectionMax = 1.05; %Maximum errr correction, to avoid large correction from noise
yAccel.Correction = 0;

dataSettings.yToVoltConst = .001/8; %convert yCorrection to vCorrection
dataSettings.corrPower = 1;  %Power of correction e.g. Linear(1), Square(2), Cube(3)
%%
fg1.Freq = 80;
fg1.Volt = 0.100;
fg1.VCorrection = 0;
fg1.VMax = 1.1;
fg1.VMin = 0.050;
counts.forFG1 = 0;    %Is in use in main

%%
%more arrays
dataSettings.jump_Threshhold = 0.10 * 3; %ten percent of 3g
counts.forPrerecord = 0;
dataSettings.n_prerecord = 100; % number to finish collecting before corrections
datas.fg1Volt = zeros(1,datas.n); %fg1 Voltages %unit = Vpp
datas.Error = zeros(1,datas.n); %difference from expected Value %unit = g
datas.Error_MA = zeros(1,datas.n); %MA of error
dataSettings.n_Error_MA = 20; %n of Error MA
%
dataSettings.req_fit = 8; %Percent fit_MA required for a big jump %unit = %
dataSettings.n_MA_fit = 20; %number of points in moving average for fit
datas.fit = zeros(1, datas.n); %Absolute Perfect of difference from previous accel %unit = %
datas.fit_MA = zeros(1, datas.n); %unit = %
%
dataSettings.req_K_AV_fit = 1; %Percent required in K_AV_fit_MA
dataSettings.n_timeDelay = 1; %sampled delayed between voltage and accel
dataSettings.n_MA_K_AV = 20; %number of points in moving average for K_AV

datas.K_AV = zeros(1, datas.n); %ratio acceleration to Voltage %unit = g/Vpp
datas.K_AV_MA = zeros(1, datas.n); %moving average %unit = g/Vpp
datas.K_AV_fit = zeros(1, datas.n); %how well each point fit to its MA %unit = %
%This is the value that decides if the K_AV_MA is suitable
datas.K_AV_fit_MA = zeros(1, datas.n); %MA of fit to MA %unit = %
              
%jumpdown
counts.forJump = 0;
dataSettings.jumpDel = 20;

dataSettings.jumpDownFitTHold = 10;
dataSettings.jumpDownVoltTHold = 0.650;
dataSettings.jumpDownSafeVolt = 0.600;
dataSettings.noLid_K_AV = 6.7;

dataSettings.kavUpperLimJump = 8;
dataSettings.kavLowerLimJump = 3.8;

return;
end
