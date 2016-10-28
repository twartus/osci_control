fg1.Volt = round(fg1.Volt*10^3)/10^3;

fprintf(functionGen1,sprintf('VOLT %d', fg1.Volt)); %Send new voltage to FG1

fg1.nowVoltage = fg1.Volt;
% fprintf(functionGen1,sprintf('VOLT %d', round(fg1Volt,3))); %Send new voltage to FG1
