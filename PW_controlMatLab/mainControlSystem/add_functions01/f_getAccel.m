function [datas_Accel ] = f_getAccel(datas, arduino1, LIS331)

%%
%Accel
%Shift
datas_Accel(1:(datas.n-1)) = datas.Accel(2:datas.n);
%read in
datas_Accel(datas.n) = fscanf(arduino1, '%f');        %Read in New Data   
%normalize, cut deci
datas_Accel(datas.n) = abs((datas_Accel(datas.n)- LIS331.y1g) * LIS331.y1g_inverted);


return;
end