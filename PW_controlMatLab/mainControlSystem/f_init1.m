%To be commented later -Eric
%Drivers have been added

% variables
%%
numberOfData = 500;  %how many points to plot
data = zeros(1, numberOfData);  %accel data array
sampFreq = 80;
t = (0:1/sampFreq:(numberOfData-1)/sampFreq);
%accel normalization constants
y0g = 0;
y1g = 2720;
%Target accel
%Corrections to V are made until within yTarget+-yTriggerMin
%Corrections rate is limited at yTarget +- yCorrectionMax
%%
% yTarget = getappdata(gui, 'accel_Field');
yError = 0;
yErrorMag = 0;
yTriggerMin = 0.050; %Minimum error to trigger correction
yCorrectionMax = 1.15; %Maximum errr correction, to avoid large correction from noise
yCorrection = 0;

yToVoltConst = .02; %convert yCorrection to vCorrection
corrPower = 1;  %Power of correction e.g. Linear(1), Square(2), Cube(3)
%%
fg1Freq = 80;
fg1Volt = 0.100;
fg1VCorrection = 0;
fg1VCorrArray = zeros(1,numberOfData);
fg1VMax = 1.1;
fg1VMin = 0;
