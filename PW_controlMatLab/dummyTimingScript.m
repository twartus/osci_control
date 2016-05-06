% f = @()dummyTiming();
% samples = zeros(1,100);
N1 = 20;
N2 = 20;
sum = 0;
%  global y1g;
%  global y0g;
%  y1g = 508.876;
%  y0g = 532.654;
% global t;
% t = 0:0.001:0.10;
% sinn = sin(t*50);
% 
% 
%          subplot(2,1,1);
%          h = plot(sinn,t);
%          axis([-3, 3, -3, 3]);
%             set(h,'XData',t,'YData',sinn);
%          subplot(2,1,2);
%          g = plot(t,sinn);
%          axis([-3, 3, -3, 3]);

for k = 1:N1
    tic;
    for j = 1: N2
        f_plotData;
        t = t + 0.1;
        data = sin(t);
        %f
%         this = sprintf('VOLT %d', 320.98); 
%          subplot(2,1,1);
%          h = scatter(sinn,t);
%          axis([-3, 3, -3, 3]);
%              set(h,'XData',t,'YData',sinn);
%             hold('on');
%          subplot(2,1,2);
%          g = scatter(t,sinn);
%          axis([-3, 3, -3, 3]);
%             set(g,'XData',sinn,'YData',t);
%            hold('off');
         
%         drawnow;
         %t(1:99) = t(2:100);
         %t(100) = t(100) + .0071;
 %        t = t + 0.0071;
 %        sinn = sin(t*50);
    end;
%    samples(k) = toc;
    sum = sum + toc;
end
average = sum / (N1 * N2)
%timeit(f)
