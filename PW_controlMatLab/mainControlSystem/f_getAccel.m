%%
%Accel
%Shift
data_Accel(1:(numberOfData-1)) = data_Accel(2:numberOfData);
%read in
data_Accel(numberOfData) = fscanf(arduino1, '%f');        %Read in New Data   
%normalize, cut deci
data_Accel(numberOfData) = abs((data_Accel(numberOfData)- y1g) * y1g_inv);