function [fg1_nowVoltage] = f_voltRead(functionGen1)

fprintf(functionGen1,'VOLT?');
fg1_nowVoltage = fscanf(functionGen1, '%f');

return;
end
