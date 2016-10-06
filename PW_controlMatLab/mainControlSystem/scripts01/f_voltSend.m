fg1Volt = round(fg1Volt*10^3)/10^3;

fprintf(functionGen1,sprintf('VOLT %d', fg1Volt)); %Send new voltage to FG1

now_fg1_Voltage = fg1Volt;
% fprintf(functionGen1,sprintf('VOLT %d', round(fg1Volt,3))); %Send new voltage to FG1
