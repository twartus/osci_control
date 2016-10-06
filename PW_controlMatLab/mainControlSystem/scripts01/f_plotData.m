set(plot1,'YData',data_Accel);            %hopefully faster than other ways 
                                    %it did not. took 25ms+
                                    
% set(plot1,'Ydata', filter(filt_num, filt_den, data));
                                    
set(plot2,'YData',data_Error);   

%note: Possible Requirement is to switch between figure(1) and figure(2)
if(mode_plotting_extra == 1)
    set(p2_1,'YData',data_fg1Volt); 
    set(p2_2,'YData',data_Error); 
    set(p2_3,'YData',data_Error_MA); 
    set(p2_4,'YData',data_fit_MA); 
    
    set(p2_5,'YData',data_K_AV); 
    set(p2_6,'YData',data_K_AV_MA); 
    set(p2_7,'YData',data_K_AV_fit); 
    set(p2_8,'YData',data_K_AV_fit_MA); 
end;

drawnow;                            %or else waits until program end to plot




