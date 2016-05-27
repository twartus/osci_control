        if(yError >= yTriggerMin) %Above the minimum (+) trigger
            %%
            if(yError <= yCorrectionMax) %Below the maximum (+) correction
                yCorrection = yError;       %allow full Error correction
            else %Past the maximum (+) correction
                yCorrection = yCorrectionMax;   %limit the Error to Max
            end;
        elseif(yError <= (0 - yTriggerMin)) %below the minimum (-) trigger
            %%
            if(yError >= (0 - yCorrectionMax)) %Above the maximimum (-) correction
                yCorrection = yError;   %allow full Error correction
            else %Past the maximum (-) correction
                yCorrection = (0 - yCorrectionMax); %limit the error to max
            end;
        else
            %%
            yCorrection = 0;
        end;
            %%
        fg1VCorrection = sign(yCorrection) * (abs(yCorrection))^(corrPower);
        fg1VCorrection = fg1VCorrection * yToVoltConst;    %convert yCorrection to fg1VCorrection
        tempfg1Volt = fg1Volt - fg1VCorrection; %If was above target, decrease V. if was below target, increase V
        
 jumpCount = jumpCount + 1;
 if(jumpCount > (jumpDel-1))
     jumpCount = 0;
     if(data_fit_MA(n) < req_fit)
        if((data_K_AV_MA(n) > 3.8) && (data_K_AV_MA(n) < 8))
            if(data_K_AV_fit_MA(n) < req_K_AV_fit)
              tempfg1Volt = yTarget / data_K_AV_MA(numberOfData);
            end;
     
        end;
     end;
 end;