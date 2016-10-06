set(plot1,'YData',datas.Accel);            %hopefully faster than other ways 
                                    %it did not. took 25ms+
                                    
% set(plot1,'Ydata', filter(filt_num, filt_den, data));
                                    
set(plot2,'YData',datas.Error);   

%note: Possible Requirement is to switch between figure(1) and figure(2)
if(mode_plotting_extra == 1)
    set(p2_1,'YData',datas.fg1Volt); 
    set(p2_2,'YData',datas.Error); 
    set(p2_3,'YData',datas.Error_MA); 
    set(p2_4,'YData',datas.fit_MA); 
    
    set(p2_5,'YData',datas.K_AV); 
    set(p2_6,'YData',datas.K_AV_MA); 
    set(p2_7,'YData',datas.K_AV_fit); 
    set(p2_8,'YData',datas.K_AV_fit_MA); 
end;

drawnow;                            %or else waits until program end to plot




