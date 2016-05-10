set(plot1,'YData',data);          %hopefully faster than other ways 
                                    %it did not. took 25ms+
set(plot2,'YData',fg1VCorrArray);   
drawnow;                            %or else waits until program end to plot


% set(plot1,'XData',t,'YData',data);          %hopefully faster than other ways 
% set(plot2,'XData',t,'YData',fg1VCorrArray);
% drawnow;