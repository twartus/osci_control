function [ data_Accel ] = f_record(n_recorded, arduino1 , y1g, y0g )

data_Accel = zeros(n_recorded, 1);

for n = 1:n_recorded;
    data_Accel(n) = fscanf(arduino1, '%f');  
    data_Accel(n) = abs((data_Accel(n)- y1g) / (y0g - y1g));
    if(mod(n,100) == 0);
       fprintf('Still recording! %d \n', n);
        %n
    end;
end;

end