
%read in
data_Accel(numberOfData) = fscanf(arduino1, '%f');        %Read in New Data   

%To be deleted when I verify the other ones work
% %normalize, normal
% % data(numberOfData) = abs((data(numberOfData)- y1g) / (y0g - y1g));   %normalize
% 
% %normalize, cut deci
% data_Accel(numberOfData) = abs((data_Accel(numberOfData)- y1g) * y1g_inv);
%      
%      %      data(numberOfData) = abs((data(numberOfData)- 0) / (y0g - y1g));   %normalize

