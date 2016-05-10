function [ data ] = f_record(n_recorded, arduino1 , y1g, y0g )

data = zeros(n_recorded, 1);

for n = 1:n_recorded;
    data(n) = fscanf(arduino1, '%f');  
    data(n) = abs((data(n)- y1g) / (y0g - y1g));
    if(mod(n,100) == 0);
        disp(sprintf('Still recording! %d', n));
        %n
    end;
end;

end