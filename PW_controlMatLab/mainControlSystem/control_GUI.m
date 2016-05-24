function varargout = control_GUI(varargin)
% CONTROL_GUI MATLAB code for control_GUI.fig
%      CONTROL_GUI, by itself, creates a new CONTROL_GUI or raises the existing
%      singleton*.
%
%      H = CONTROL_GUI returns the handle to a new CONTROL_GUI or the handle to
%      the existing singleton*.
%
%      CONTROL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL_GUI.M with the given input arguments.
%
%      CONTROL_GUI('Property','Value',...) creates a new CONTROL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before control_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to control_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help control_GUI

% Last Modified by GUIDE v2.5 21-May-2016 11:35:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @control_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @control_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before control_GUI is made visible.
function control_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to control_GUI (see VARARGIN)

% Initialize Predefined Variables

set(handles.control_button, 'Value');
handles.control_Mode = 0;
setappdata(hObject, 'control_Mode', handles.control_Mode);

set(handles.plot_button, 'Value');
handles.plot_Mode = 0;
setappdata(hObject, 'plot_Mode', handles.plot_Mode);

set(handles.record_button, 'Value');
handles.record_Mode = 0;
setappdata(hObject, 'record_Mode', handles.plot_Mode);

set(handles.acceleration_field, 'Value');
handles.accel_Field = 0.0;
setappdata(hObject, 'accel_Field', handles.accel_Field);

% Choose default command line output for control_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes control_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = control_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function acceleration_field_Callback(hObject, eventdata, handles)
% hObject    handle to acceleration_field (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.acceleration_field, 'Value');
accel_Field = get(hObject, 'String');
handles.accel_Field = str2double(accel_Field);
guidata(hObject, handles);
setappdata(hObject, 'accel_Field', accel_Field);

% Hints: get(hObject,'String') returns contents of acceleration_field as text
%        str2double(get(hObject,'String')) returns contents of acceleration_field as a double


% --- Executes during object creation, after setting all properties.
function acceleration_field_CreateFcn(hObject, eventdata, handles)
% hObject    handle to acceleration_field (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in control_button.
function control_button_Callback(hObject, eventdata, handles)
% hObject    handle to control_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.control_button, 'Value');
control_Mode = get(hObject, 'Value');
handles.control_Mode = control_Mode;
guidata(hObject, handles);
setappdata(hObject, 'control_Mode', control_Mode);


% --- Executes on button press in plot_button.
function plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.plot_button, 'Value');
plot_Mode = get(hObject, 'Value');
handles.plot_Mode = plot_Mode;
guidata(hObject, handles);
setappdata(hObject, 'plot_Mode', plot_Mode);


% --- Executes on button press in record_button.
function record_button_Callback(hObject, eventdata, handles)
% hObject    handle to record_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.record_button, 'Value');
record_Mode = get(hObject, 'Value');
handles.record_Mode = record_Mode;
guidata(hObject, handles);
setappdata(hObject, 'record_Mode', record_Mode);


% --- Executes on button press in run_button.
function run_button_Callback(hObject, eventdata, handles)
% hObject    handle to run_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

setappdata(handles.figure1, 'control_Mode', handles.control_Mode);
setappdata(handles.figure1, 'plot_Mode', handles.plot_Mode);
setappdata(handles.figure1, 'record_Mode', handles.record_Mode);
setappdata(handles.figure1, 'accel_Field', handles.accel_Field);
uiresume();

% new_main(handles.control_Mode, ...
%           handles.plot_Mode,   ...
%           handles.record_Mode, ...
%           handles.accel_Field);


% --- Executes on button press in stop_button.
function stop_button_Callback(hObject, eventdata, handles)
% hObject    handle to stop_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all; clear; clc;
f_exitSequence;

% --- Executes during object creation, after setting all properties.
function record_button_CreateFcn(hObject, eventdata, handles)
% hObject    handle to record_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
