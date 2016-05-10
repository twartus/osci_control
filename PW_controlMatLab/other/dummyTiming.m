function [] = dummyTiming()
global y0g;
global y1g;
%global t;
%figure(1);
%grid('on');
%plot(t);
%drawnow;
 for i = 3600:3700
     norm = (i - y0g) / (y1g - y0g);
 end;
return;
end


