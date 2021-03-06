%%
%Sweeps voltages, takes steady state peak accels
%make sure to set arduino to char mode for better accuracy
%char takes a while to complete
%current for loop will offset most measurements by 1 place
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
% sampFreq = 80;
charVLow = 0.100;
charVHigh = 0.800;
plotAHigh = 5;
charStep = 0.001;
nStepData = ((charVHigh - charVLow)/charStep) + 1;
data_charVolt = (charVLow:charStep:charVHigh);
% data_charAccel = zeros(1, nStepData);
data_charAccel = data_charVolt*0;


fprintf(functionGen1,sprintf('VOLT %d', nowVoltage));   %initialize
fprintf(functionGen1,sprintf('FREQ %d', 80));


for i = 1:nStepData
    %%
    nowVoltage = data_charVolt(i);  %Next char volt
    if(nowVoltage > 0.950) %safety
        fprintf('Error! %d \n', n);
        fprintf(functionGen1,sprintf('VOLT %d', 0.100));
        return;
    else
        if((mod(i,100) ==0))
            fprintf('Sweep step %d of %d \n', i, nStepData);
        end;
        fprintf(functionGen1,sprintf('VOLT %d', nowVoltage));
    end;
    %%
    
    data_charAccel(i) = fscanf(arduino1, '%f');        %Read in New Data               
end;
%allow rest
fprintf(functionGen1,sprintf('VOLT %d', 0.100));
%%
data_charAccel = abs((data_charAccel- y1g) / (y0g - y1g));   %normalize

%%

figure(1);
clf;
%%

plot(data_charVolt, data_charAccel);
grid('on');
    title('Accel (g)')
    xlabel('FG Voltage');
    ylabel('Peak accel (g)');
    axis([0,charVHigh,0,plotAHigh]);

