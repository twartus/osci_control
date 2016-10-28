function [yAccel, fg1, tempfg1Volt, counts ] = f_getNewVolt( dataSettings, n, datas, yAccel, fg1, counts)

if(yAccel.Error >= yAccel.TriggerMin) %Above the minimum (+) trigger
            %%
            if(yAccel.Error <= yAccel.CorrectionMax) %Below the maximum (+) correction
                yAccel.Correction = yAccel.Error;       %allow full Error correction
            else %Past the maximum (+) correction
                yAccel.Correction = yAccel.CorrectionMax;   %limit the Error to Max
            end;
        elseif(yAccel.Error <= (0 - yAccel.TriggerMin)) %below the minimum (-) trigger
            %%
            if(yAccel.Error >= (0 - yAccel.CorrectionMax)) %Above the maximimum (-) correction
                yAccel.Correction = yAccel.Error;   %allow full Error correction
            else %Past the maximum (-) correction
                yAccel.Correction = (0 - yAccel.CorrectionMax); %limit the error to max
            end;
        else
            %%
            yAccel.Correction = 0;
end;
            %%
        fg1.VCorrection = sign(yAccel.Correction) * (abs(yAccel.Correction))^(dataSettings.corrPower);
        fg1.VCorrection = fg1.VCorrection * dataSettings.yToVoltConst;    %convert yAccel.Correction to fg1VCorrection
        tempfg1Volt = fg1.Volt - fg1.VCorrection; %If was above target, decrease V. if was below target, increase V
 %%
 %Jump When Stable
 counts.forJump = counts.forJump + 1;
 if(counts.forJump > (dataSettings.jumpDel-1))
     counts.forJump = 0;
     if(abs(datas.Error_MA(datas.n)) > dataSettings.jump_Threshhold) 
        if(datas.fit_MA(n) < dataSettings.req_fit)
            if((datas.K_AV_MA(n) > 3.8) && (datas.K_AV_MA(n) < 8))
                if(datas.K_AV_fit_MA(n) < dataSettings.req_K_AV_fit)
                    tempfg1Volt = (yAccel.Target / datas.K_AV_MA(datas.n)) - fg1.nowVoltage;
                    tempfg1Volt = (tempfg1Volt * 0.95) + fg1.nowVoltage; 
%                     tempfg1Volt = yTarget / datas.K_AV_MA(datas.n);
                    
                end;
            end;
        end;
     end;
 end;
 
%%
%Jump Down When Unstable
if((datas.fit_MA(n) > dataSettings.jumpDownFitTHold) && (fg1.nowVoltage > dataSettings.jumpDownVoltTHold))
%     tempfg1Volt = yTarget / noLid_K_AV;
    tempfg1Volt = dataSettings.jumpDownSafeVolt;
end;

return;
end
 
 