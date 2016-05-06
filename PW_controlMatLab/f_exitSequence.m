

% Give the external device some time…
pause(3);

 return;

% Some of these crash the program – it depends. The serial port is left
% open, which is not good.                                              
stopasync(arduino1);
fclose(arduino1);   % to close
delete(arduino1);   % to delete
fclose(functionGen1);   %to close
delete(functionGen1);   %to delete
clear arduino1;
clear functionGen1;
fprintf(1, 'Sorry, you"re going to have to close out of Matlab to close the serial port\n');
return


