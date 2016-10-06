yError = data_Accel(numberOfData) - yTarget;  %negative if below, positive if above  target.
data_Error(numberOfData) = yError;           %redundant but ok-ish
data_Error(1:(numberOfData-1)) = data_Error(2:numberOfData);  %shift, store the errors