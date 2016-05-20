%%
mode_run = 1;              
mode_initializeFG = 0;     
mode_dataReading = 1;   
mode_voltControl = 1;      
mode_plotting = 1;          
mode_record = 0;            
%%
f_init1;
f_init2;
%%
sampFreq = 80;
charLow = 0.200;
charHigh = 0.800;
data_stepVolt = zeros(1, nStepData);   %initialize data
data_stepAccel = zeros(1, nStepData);


fprintf(functionGen1,sprintf('VOLT %d', nowVoltage));   %initialize
fprintf(functionGen1,sprintf('FREQ %d', 80));


for i = 1:nStepData
    %%
    if ( mod(i,stepEveryN) == 0)
        if(nowVoltage == stepLow)
            nowVoltage = stepHigh;  %if low, go high
        else
            nowVoltage = stepLow;   %else go low
        end;
        if(nowVoltage > 0.750) %safety
            fprintf('Error! %d \n', n);
            return;
        else
            fprintf('Stepping at n = %d \n', i);
            fprintf('Stepping to %d \n', nowVoltage);
            fprintf(functionGen1,sprintf('VOLT %d', nowVoltage));
        end;
    end;
    %%
    data_stepAccel(i) = fscanf(arduino1, '%f');        %Read in New Data               
    data_stepVolt(i) = nowVoltage;
end;

%%
data_stepAccel = abs((data_stepAccel- y1g) / (y0g - y1g));   %normalize
stepTimes = (0:1/sampFreq:(nStepData-1)/sampFreq);
%%

figure(1);
clf;
%%

plot(data_stepVolt, data_stepAccel);
grid('on');
    title('Accel (g)')
    xlabel('FG Voltage');
    ylabel('peak accel (g)');
    axis([0,nStepData/sampFreq,0,4]);

