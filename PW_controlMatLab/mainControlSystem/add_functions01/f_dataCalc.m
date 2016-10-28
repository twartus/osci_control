function [datas, yAccel] = f_dataCalc( datas, fg1, dataSettings, yAccel) 

% %%
% %Accel
% %Shift
% datas.Accel(1:(datas.n-1)) = datas.Accel(2:datas.n);
% %normalize, cut deci
% datas.Accel(datas.n) = abs((datas.Accel(datas.n)- y1g) * y1g_inv);

%%
%Shift
datas.fg1Volt(1:(datas.n-1)) = datas.fg1Volt(2:datas.n);
%Voltage
datas.fg1Volt(datas.n) = fg1.Volt;

%%
%Error
%shift
datas.Error(1:(datas.n-1)) = datas.Error(2:datas.n);  %shift, store the errors
%calculate
datas.Error(datas.n) = datas.Accel(datas.n) - yAccel.Target;  %negative if below, positive if above  target.
%restore, redundant
% datas.Error(datas.n) = yError;           %redundant but ok-ish

%%
%Error MA
%shift
datas.Error_MA(1:(datas.n-1)) = datas.Error_MA(2:datas.n);  %shift
%calculate
datas.Error_MA(datas.n) = 0;
for j = 1:dataSettings.n_Error_MA
    datas.Error_MA(datas.n) = datas.Error_MA(datas.n) + datas.Error(datas.n + 1 - j);
end;
datas.Error_MA(datas.n) = datas.Error_MA(datas.n)/dataSettings.n_Error_MA;
%send to calcNext
yAccel.Error = datas.Error_MA(datas.n);
%%
%fit
%shift
datas.fit(1:(datas.n-1)) = datas.fit(2:datas.n);  %shift, store the errors
%calculate fit, to the previous value
datas.fit(datas.n) = datas.Accel(datas.n - 1) - datas.Accel(datas.n);
datas.fit(datas.n) = datas.fit(datas.n) / datas.Accel(datas.n);
datas.fit(datas.n) = round(datas.fit(datas.n) * 10^4 )/10^2;%two deci places
datas.fit(datas.n) = abs(datas.fit(datas.n));
%MA
datas.fit_MA(1:(datas.n-1)) = datas.fit_MA(2:datas.n);  %shift
datas.fit_MA(datas.n) = 0;
for j = 1:dataSettings.n_MA_fit
    datas.fit_MA(datas.n) = datas.fit_MA(datas.n) + datas.fit(datas.n + 1 - j);
end;
datas.fit_MA(datas.n) = datas.fit_MA(datas.n)/dataSettings.n_MA_fit;

%%
%K_AV

% dataSettings.n_MA_K_AV = 10; %number of points in moving average for K_AV

%K_AV
%shift
datas.K_AV(1:(datas.n-1)) = datas.K_AV(2:datas.n);  %shift
%calc
datas.K_AV(datas.n) = datas.Accel(datas.n) / datas.fg1Volt(datas.n);

%K_AV_MA
%shift
datas.K_AV_MA(1:(datas.n-1)) = datas.K_AV_MA(2:datas.n);  %shift
%calc MA
datas.K_AV_MA(datas.n) = 0;
for j = 1:dataSettings.n_MA_K_AV
    datas.K_AV_MA(datas.n) = datas.K_AV_MA(datas.n) + datas.K_AV(datas.n + 1 - j);
end;
datas.K_AV_MA(datas.n) = datas.K_AV_MA(datas.n)/dataSettings.n_MA_K_AV;

%K_AV_fit
%shift
datas.K_AV_fit(1:(datas.n-1)) = datas.K_AV_fit(2:datas.n);  %shift
%calculate fit, to the K_AV_MA
%In Percents
datas.K_AV_fit(datas.n) = datas.K_AV_MA(datas.n) - datas.K_AV(datas.n);
datas.K_AV_fit(datas.n) = datas.K_AV_fit(datas.n) / datas.K_AV_MA(datas.n);
datas.K_AV_fit(datas.n) = round(datas.K_AV_fit(datas.n) * 10^4 )/10^2;%two deci places
datas.K_AV_fit(datas.n) = abs(datas.K_AV_fit(datas.n));

%K_AV_fit_MA
%shift
datas.K_AV_fit_MA(1:(datas.n-1)) = datas.K_AV_fit_MA(2:datas.n);  %shift
%calculate
datas.K_AV_fit_MA(datas.n) = 0;
for j = 1:dataSettings.n_MA_K_AV
    datas.K_AV_fit_MA(datas.n) = datas.K_AV_fit_MA(datas.n) + datas.K_AV_fit(datas.n + 1 - j);
end;
datas.K_AV_fit_MA(datas.n) = datas.K_AV_fit_MA(datas.n)/dataSettings.n_MA_K_AV;

return;
end
