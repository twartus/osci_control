function [fg1_Volt] = f_voltLimit(tempfg1Volt, fg1)
%More limits to be added later, such as accel and changerate
if(tempfg1Volt<fg1.VMax && tempfg1Volt>fg1.VMin)  %if temp below max and above min, temp is good
    fg1_Volt = tempfg1Volt;                      %update fg1Volt with temp value
end;

return;
end