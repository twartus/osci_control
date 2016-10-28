%Settings: 1 means YES, 0 means NO (anything not 1 also means NO)
%maybe later changes to >0 means YES, 0 means NO

modes.record = getappdata(gui, 'record_Mode'); %record data

modes.voltControl = getappdata(gui, 'control_Mode');      
                            
                            %allow automatic voltage updating
                            %allow patterns to trigger program end
                            
modes.plotting = getappdata(gui, 'plot_Mode');  
                            
modes.run = 1;               %run the program. Should always be on

modes.initializeFG = modes.voltControl;      %sets the FG during init3. Should always be on

modes.dataReading = 1;       %read data and process it


       

modes.plotting_extra = 1;
                            
