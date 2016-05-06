set(plot1,'YData',data);          %hopefully faster than other ways 
% set(plot2,'YData',fg1VCorrArray);
drawnow;                            %or else waits until program end to plot

% figure(2);
%  plot(t,data);

% drawnow;

% set(plot1,'XData',t,'YData',data);          %hopefully faster than other ways 
% set(plot2,'XData',t,'YData',fg1VCorrArray);
% drawnow;