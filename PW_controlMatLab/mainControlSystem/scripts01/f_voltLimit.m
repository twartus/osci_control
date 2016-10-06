
%More limits to be added later, such as accel and changerate
if(tempfg1Volt<fg1VMax && tempfg1Volt>fg1VMin)  %if temp below max and above min, temp is good
    fg1Volt = tempfg1Volt;                      %update fg1Volt with temp value
end;