%To be Commented Later -Eric
f_settings; %select operations to run, and other high level details
            
f_init1;    %initialize variables, and other low level stuff
f_init2;    %initialize variables, and other low level stuff

while(mode_run == 1)
    
    if(mode_dataReading == 1)   %~1ms
        f_getAccel;     %take in acceleration reading
        f_dataShift;    %shift data registers to left
    
        f_getNewVolt;   %calculate new Voltage to send
        f_voltLimit;    %apply limits
    end;
    tic
    if(mode_voltControl ==1)    %~3-5ms
        f_voltSend;     %send the new voltage
    end;
    toc
    if(mode_plotting == 1)      %25-30ms
        f_plotData;     %plot data for visuals
    end;                %last because it is slowest
    
end;

f_exitSequence;     %exit it the program.
                    %Usually does not occur.
                    %ctrl+C to stop program
