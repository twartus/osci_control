%%
%Accel
%Shift
datas.Accel(1:(datas.n-1)) = datas.Accel(2:datas.n);
%read in
datas.Accel(datas.n) = fscanf(arduino1, '%f');        %Read in New Data   
%normalize, cut deci
datas.Accel(datas.n) = abs((datas.Accel(datas.n)- LIS331.y1g) * LIS331.y1g_inverted);