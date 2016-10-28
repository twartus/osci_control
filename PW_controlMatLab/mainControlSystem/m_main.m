%%
%To be Commented Later -Eric
addpath('add_scripts01');
addpath('add_functions01');
gui = control_GUI;
uiwait(gui);

f_settings; %select operations to run, and other high level details
            
% f_init1;    %initialize variables, and other low level stuff
[ counts, datas, dataSettings, fg1, LIS331, n, sampFreq, t, yAccel   ] = f_init1(gui);
f_init2;    %initialize variables, and other low level stuff
f_init3;    %initialize communications and plots
%%
tic
while(modes.run == 1)
  toc
  tic
    %%
    if(modes.dataReading == 1)
%         f_getAccel;     %take in acceleration reading
        [datas.Accel ] = f_getAccel(datas, arduino1, LIS331);
%         f_dataCalc;   %shift data, normalize, calculate derived values
        [datas, yAccel] = f_dataCalc( datas, fg1, dataSettings, yAccel);
    
%         f_errorCalc;    %calculate Error and shift
%has been moved into dataCalc
        
    end;
    
    %%
    
    if(modes.voltControl ==1)
        
        %         f_getNewVolt;   %calculate new Voltage to send
        [yAccel, fg1, tempfg1Volt, counts ] = f_getNewVolt( dataSettings, n, datas, yAccel, fg1, counts);
%         f_voltLimit;    %apply limits
        [fg1.Volt] = f_voltLimit(tempfg1Volt, fg1);
        
        
        
        if(counts.forPrerecord > dataSettings.n_prerecord)
            counts.forFG1 = counts.forFG1+1;
            if(counts.forFG1 > 7)
                f_voltSend;     %send the new voltage
                counts.forFG1 = 0;
            end;
        elseif (counts.forPrerecord < dataSettings.n_prerecord)
            counts.forPrerecord = counts.forPrerecord + 1;
            fg1.Volt = fg1.nowVoltage; %undo anything the control tried to do
        elseif (counts.forPrerecord == dataSettings.n_prerecord)
            counts.forPrerecord = counts.forPrerecord + 1;
            fg1.Volt = fg1.nowVoltage; %undo anything the control tried to do
        end;
    end;
    %%

    if(modes.plotting == 1)
        counts.forPlot = counts.forPlot + 1;
        if (counts.forPlot > 7)
            f_plotData;     %plot data for visuals
            counts.forPlot = 0;
        end;
    end;                %last because it is slowest
    
end;
%%
if(modes.record == 1);
    [recorded_seg] = f_record(800, arduino1, y1g, y0g);
end;
%%
f_exitSequence;     %exit it the program.
                    %Usually does not occur.
                    %ctrl+C to stop program
