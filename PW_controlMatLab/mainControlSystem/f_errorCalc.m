yError = data(numberOfData) - yTarget;  %negative if below, positive if above  target.
fg1VCorrArray(numberOfData) = yError;           %redundant but ok-ish
fg1VCorrArray(1:(numberOfData-1)) = fg1VCorrArray(2:numberOfData);  %shift, store the errors