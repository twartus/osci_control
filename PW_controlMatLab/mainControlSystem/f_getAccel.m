
%read in
data(numberOfData) = fscanf(arduino1, '%f');        %Read in New Data   

%normalize, normal
% data(numberOfData) = abs((data(numberOfData)- y1g) / (y0g - y1g));   %normalize

%normalize, cut deci
data(numberOfData) = abs((data(numberOfData)- y1g) * y1g_inv);
     
     %      data(numberOfData) = abs((data(numberOfData)- 0) / (y0g - y1g));   %normalize

