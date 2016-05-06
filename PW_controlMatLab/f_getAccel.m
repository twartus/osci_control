    data(numberOfData) = fscanf(arduino1, '%f');        %Read in New Data               
    data(numberOfData) = abs((data(numberOfData)- y1g) / (y0g - y1g));   %normalize