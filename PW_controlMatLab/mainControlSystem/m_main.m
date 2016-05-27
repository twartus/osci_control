%%
%To be Commented Later -Eric

gui = control_GUI;
uiwait(gui);

f_settings; %select operations to run, and other high level details
            
f_init1;    %initialize variables, and other low level stuff
f_init2;    %initialize variables, and other low level stuff
f_init3;    %initialize communications and plots
%%
tic
while(mode_run == 1)
  toc
  tic
    %%
    if(mode_dataReading == 1)
        f_getAccel;     %take in acceleration reading
        f_dataCalc;   %shift data, normalize, calculate derived values
    
%         f_errorCalc;    %calculate Error and shift
%has been moved into dataCalc
        
        f_getNewVolt;   %calculate new Voltage to send
        f_voltLimit;    %apply limits
    end;
    
    %%
    
    if(mode_voltControl ==1)
        if(prerecordCount > n_prerecord)
            fgCount = fgCount+1;
            if(fgCount > 7)
                f_voltSend;     %send the new voltage
                fgCount = 0;
            end;
        elseif (prerecordCount < n_prerecord)
            prerecordCount = prerecordCount + 1;
            fg1Volt = now_fg1_Voltage; %undo anything the control tried to do
        elseif (prerecordCount == n_prerecord)
            prerecordCount = prerecordCount + 1;
            fg1Volt = now_fg1_Voltage; %undo anything the control tried to do
        end;
    end;
    %%

    if(mode_plotting == 1)
        plotCount = plotCount + 1;
        if (plotCount > 7)
            f_plotData;     %plot data for visuals
            plotCount = 0;
        end;
    end;                %last because it is slowest
    
end;
%%
if(mode_record == 1);
    [recorded_seg] = f_record(800, arduino1, y1g, y0g);
end;
%%
f_exitSequence;     %exit it the program.
                    %Usually does not occur.
                    %ctrl+C to stop program
