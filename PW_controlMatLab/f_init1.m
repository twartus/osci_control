%To be commented later -Eric
%Drivers have been added

% variables
%modes: Set to 1 to enable, Set to 0 to disable. 
%These are simple variables used in if statements
initMode = 0; %if initMode > 0, initialize frequency and amplitude
plotMode = 1; %if plotMode > 0, plot graphs
correctionMode = 0; %if correctionMode > 0, adjust voltage using acceleration error


numberOfData = 50;  %how many points to plot
data = zeros(1, numberOfData);  %accel data array
sampFreq = 10;
t = (0:1/sampFreq:(numberOfData-1)/sampFreq);
%accel normalization constants
y0g = 508;
y1g = 529;
%Target accel
%Corrections to V are made until within yTarget+-yTriggerMin
%Corrections rate is limited at yTarget +- yCorrectionMax
yTarget = 3.00;
yError = 0;
yErrorMag = 0;
yTriggerMin = 0.050; %Minimum error to trigger correction
yCorrectionMax = 1.15; %Maximum errr correction, to avoid large correction from noise
yCorrection = 0;

yToVoltConst = .02; %convert yCorrection to vCorrection

fg1Freq = 80;
fg1Volt = 0.100;
fg1VCorrection = 0;
fg1VCorrArray = zeros(1,numberOfData);
fg1VMax = 1.1;
fg1VMin = 0;
