yError = data(numberOfData) - yTarget;  %negative if below, positive if above  target.
dataE(numberOfData) = yError;           %redundant but ok-ish
dataE(1:(numberOfData-1)) = dataE(2:numberOfData);  %shift, store the errors