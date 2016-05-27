%%
%Accel
%Shift
data_Accel(1:(numberOfData-1)) = data_Accel(2:numberOfData);
%normalize, cut deci
data_Accel(numberOfData) = abs((data_Accel(numberOfData)- y1g) * y1g_inv);

%%
%Shift
data_fg1Volt(1:(numberOfData-1)) = data_fg1Volt(2:numberOfData);
%Voltage
data_fg1Volt(numberOfData) = fg1Volt;

%%
%Error
%shift
data_Error(1:(numberOfData-1)) = data_Error(2:numberOfData);  %shift, store the errors
%calculate
yError = data_Accel(numberOfData) - yTarget;  %negative if below, positive if above  target.
%restore, redundant
data_Error(numberOfData) = yError;           %redundant but ok-ish

%%
%fit
%shift
data_fit(1:(numberOfData-1)) = data_fit(2:numberOfData);  %shift, store the errors
%calculate fit, to the previous value
data_fit(numberOfData) = data_Accel(numberOfData - 1) - data_Accel(numberOfData);
data_fit(numberOfData) = data_fit(numberOfData) / data_Accel(numberOfData);
data_fit(numberOfData) = round(data_fit(numberOfData) * 10^4 )/10^2;%two deci places
data_fit(numberOfData) = abs(data_fit(numberOfData));
%MA
data_fit_MA(1:(numberOfData-1)) = data_fit_MA(2:numberOfData);  %shift
data_fit_MA(numberOfData) = 0;
for j = 1:n_MA_fit
    data_fit_MA(numberOfData) = data_fit_MA(numberOfData) + data_fit(numberOfData + 1 - j);
end;
data_fit_MA(numberOfData) = data_fit_MA(numberOfData)/n_MA_fit;

%%
%K_AV

n_MA_K_AV = 10; %number of points in moving average for K_AV

%K_AV
%shift
data_K_AV(1:(numberOfData-1)) = data_K_AV(2:numberOfData);  %shift
%calc
data_K_AV(numberOfData) = data_Accel(numberOfData) / data_fg1Volt(numberOfData);

%K_AV_MA
%shift
data_K_AV_MA(1:(numberOfData-1)) = data_K_AV_MA(2:numberOfData);  %shift
%calc MA
data_K_AV_MA(numberOfData) = 0;
for j = 1:n_MA_K_AV
    data_K_AV_MA(numberOfData) = data_K_AV_MA(numberOfData) + data_K_AV(numberOfData + 1 - j);
end;
data_K_AV_MA(numberOfData) = data_K_AV_MA(numberOfData)/n_MA_K_AV;

%K_AV_fit
%shift
data_K_AV_fit(1:(numberOfData-1)) = data_K_AV_fit(2:numberOfData);  %shift
%calculate fit, to the K_AV_MA
%In Percents
data_K_AV_fit(numberOfData) = data_K_AV_MA(numberOfData) - data_K_AV(numberOfData);
data_K_AV_fit(numberOfData) = data_K_AV_fit(numberOfData) / data_K_AV_MA(numberOfData);
data_K_AV_fit(numberOfData) = round(data_K_AV_fit(numberOfData) * 10^4 )/10^2;%two deci places
data_K_AV_fit(numberOfData) = abs(data_K_AV_fit(numberOfData));

%K_AV_fit_MA
%shift
data_K_AV_fit_MA(1:(numberOfData-1)) = data_K_AV_fit_MA(2:numberOfData);  %shift
%calculate
data_K_AV_fit_MA(numberOfData) = 0;
for j = 1:n_MA_K_AV
    data_K_AV_fit_MA(numberOfData) = data_K_AV_fit_MA(numberOfData) + data_K_AV_fit(numberOfData + 1 - j);
end;
data_K_AV_fit_MA(numberOfData) = data_K_AV_fit_MA(numberOfData)/n_MA_K_AV;


