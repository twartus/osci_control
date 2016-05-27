figure(1);
clf;
K_AR = data_charAccel_AR./data_charVolt_AR;
K_NL = data_charAccel_NL./data_charVolt_NL;

subplot(2,1,1);
hold('on');
plot(K_AR);
plot(K_NL);
hold('off');
subplot(2,1,2);
hold('on');
plot(data_charVolt_AR, data_charAccel_AR);
plot(data_charVolt_NL, data_charAccel_NL);

sum = 0;
count = 0;
for i = 100:700
    sum = sum + K_AR(i)
    count = count + 1;
end;
avg = sum / count