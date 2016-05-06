%Settings: 1 means YES, 0 means NO (anything not 1 also means NO)
%maybe later changes to >0 means YES, 0 means NO


mode_run = 1;               %run the program. Should always be on

mode_initializeFG = 1;      %sets the FG during init2. Should always be on

mode_dataReading = 1;       %read data and process it

mode_voltControl = 1;       %allow automatic voltage updating
                            %allow patterns to trigger program end

mode_plotting = 0;          %plot realtime graphs