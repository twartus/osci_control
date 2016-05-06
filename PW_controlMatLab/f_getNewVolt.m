        if(yError >= yTriggerMin) %Above the minimum (+) trigger
            if(yError <= yCorrectionMax) %Below the maximum (+) correction
                yCorrection = yError;       %allow full Error correction
            else %Past the maximum (+) correction
                yCorrection = yCorrectionMax;   %limit the Error to Max
            end;
        elseif(yError <= (0 - yTriggerMin)) %below the minimum (-) trigger
            if(yError >= (0 - yCorrectionMax)) %Above the maximimum (-) correction
                yCorrection = yError;   %allow full Error correction
            else %Past the maximum (-) correction
                yCorrection = (0 - yCorrectionMax); %limit the error to max
            end;
        else
            yCorrection = 0;
        end;
        fg1VCorrection = yCorrection * (abs(yCorrection))^2 * yToVoltConst;    %convert yCorrection to fg1VCorrection
        tempfg1Volt = fg1Volt - fg1VCorrection; %If was above target, decrease V. if was below target, increase V