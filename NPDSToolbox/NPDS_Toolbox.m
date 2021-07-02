function varargout = NPDS_Toolbox(varargin)
% NPDS_Toolbox MATLAB code for NPDS_Toolbox.fig
%      NPDS_Toolbox, by itself, creates a new NPDS_Toolbox or raises the existing
%      singleton*.
%
%      H = NPDS_Toolbox returns the handle to a new NPDS_Toolbox or the handle to
%      the existing singleton*.
%
%      NPDS_Toolbox('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NPDS_Toolbox.M with the given input arguments.
%
%      NPDS_Toolbox('Property','Value',...) creates a new NPDS_Toolbox or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NPDS_Toolbox_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NPDS_Toolbox_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NPDS_Toolbox

% Last Modified by GUIDE v2.5 09-Apr-2021 19:59:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @NPDS_Toolbox_OpeningFcn, ...
    'gui_OutputFcn',  @NPDS_Toolbox_OutputFcn, ...
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


% --- Executes just before NPDS_Toolbox is made visible.
function NPDS_Toolbox_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NPDS_Toolbox (see VARARGIN)

% Choose default command line output for NPDS_Toolbox
handles.output = hObject;
set(handles.Edit_Intensity,'Enable','off');
set(handles.Pause_button,'Enable','off');
set(handles.axes_Control,'xLim',[0,str2double(get(handles.Edit_FinalT,'String'))]);
set(handles.axes_Control,'yLim',[str2double(get(handles.Edit_Umin,'String')),str2double(get(handles.Edit_Umax,'String'))]);
set(handles.axes_error,'xLim',[0,str2double(get(handles.Edit_FinalT,'String'))]);
set(handles.axes_error,'yLim',[0,1]);
axes(handles.axes_distribution);
axis off;
axes(handles.axes_Control);
axis off;
axes(handles.axes_error);
axis off;
axes(handles.axes_Dsynch);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NPDS_Toolbox wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NPDS_Toolbox_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Start_button.
function Start_button_Callback(hObject, eventdata, handles)
% hObject    handle to Start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
start_model(handles)


% --- Executes on button press in Pause_button.
function Pause_button_Callback(hObject, eventdata, handles)
pause_popup_change(handles)
% hObject    handle to Pause_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Export_button.
function Export_button_Callback(hObject, eventdata, handles)
% hObject    handle to Export_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Edit_K_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_K as text
%        str2double(get(hObject,'String')) returns contents of Edit_K as a double


% --- Executes during object creation, after setting all properties.
function Edit_K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Umax_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Umax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Umax as text
%        str2double(get(hObject,'String')) returns contents of Edit_Umax as a double


% --- Executes during object creation, after setting all properties.
function Edit_Umax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Umax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Umin_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Umin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Umin as text
%        str2double(get(hObject,'String')) returns contents of Edit_Umin as a double


% --- Executes during object creation, after setting all properties.
function Edit_Umin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Umin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Popup_PRC.
function Popup_PRC_Callback(hObject, eventdata, handles)
popup_PRC_change(handles.Popup_PRC,handles);
% hObject    handle to Popup_PRC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Popup_PRC contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popup_PRC


% --- Executes during object creation, after setting all properties.
function Popup_PRC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popup_PRC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_Couple.
function checkbox_Couple_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Couple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Couple


% --- Executes on button press in checkbox_Noise.
function checkbox_Noise_Callback(hObject, eventdata, handles)
val=get(handles.checkbox_Noise,'value');
if val
    set(handles.Edit_Intensity,'Enable','on')
else
    set(handles.Edit_Intensity,'Enable','off')
end
% hObject    handle to checkbox_Noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Noise



function Edit_Intensity_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Intensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Intensity as text
%        str2double(get(hObject,'String')) returns contents of Edit_Intensity as a double


% --- Executes during object creation, after setting all properties.
function Edit_Intensity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Intensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Popup_Method.
function Popup_Method_Callback(hObject, eventdata, handles)
% hObject    handle to Popup_Method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Popup_Method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popup_Method


% --- Executes during object creation, after setting all properties.
function Popup_Method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popup_Method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Pop_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Pop as text
%        str2double(get(hObject,'String')) returns contents of Edit_Pop as a double


% --- Executes during object creation, after setting all properties.
function Edit_Pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_FinalT_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_FinalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_FinalT as text
%        str2double(get(hObject,'String')) returns contents of Edit_FinalT as a double


% --- Executes during object creation, after setting all properties.
function Edit_FinalT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_FinalT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Mean_Initial_Dist_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Mean_Initial_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Mean_Initial_Dist as text
%        str2double(get(hObject,'String')) returns contents of Edit_Mean_Initial_Dist as a double


% --- Executes during object creation, after setting all properties.
function Edit_Mean_Initial_Dist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Mean_Initial_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Varience_Initial_Dist_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Varience_Initial_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Varience_Initial_Dist as text
%        str2double(get(hObject,'String')) returns contents of Edit_Varience_Initial_Dist as a double


% --- Executes during object creation, after setting all properties.
function Edit_Varience_Initial_Dist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Varience_Initial_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton_control_proportional.
function radiobutton_control_proportional_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_control_proportional (see GCBO)
set(handles.Edit_K, 'Enable', 'on');
set(handles.Edit_Umax, 'Enable', 'on');
set(handles.Edit_Umin, 'Enable', 'on');
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton_control_proportional


% --- Executes on key press with focus on radiobutton_control_proportional and none of its controls.
function radiobutton_control_proportional_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton_control_proportional (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton_control_BangBang.
function radiobutton_control_BangBang_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_control_BangBang (see GCBO)
set(handles.Edit_K, 'Enable', 'off');
set(handles.Edit_Umax, 'Enable', 'on');
set(handles.Edit_Umin, 'Enable', 'on');
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_control_BangBang


% --- Executes on button press in radiobutton_control_Specified.
function radiobutton_control_Specified_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_control_Specified (see GCBO)
control_user_defined_choise(handles);


% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_control_Specified


% --- Executes on key press with focus on checkbox_Noise and none of its controls.
function checkbox_Noise_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to checkbox_Noise (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton_Init_Specified.
function radiobutton_Init_Specified_Callback(hObject, eventdata, handles)
set(handles.Edit_Mean_Initial_Dist,'Enable','off');
set(handles.Edit_Varience_Initial_Dist,'Enable','off');
% hObject    handle to radiobutton_Init_Specified (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_Init_Specified


% --- Executes on button press in radiobutton_Init_Gaussian.
function radiobutton_Init_Gaussian_Callback(hObject, eventdata, handles)
set(handles.Edit_Mean_Initial_Dist,'Enable','on');
set(handles.Edit_Varience_Initial_Dist,'Enable','on');
% hObject    handle to radiobutton_Init_Gaussian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_Init_Gaussian


% --------------------------------------------------------------------
function Tools_Callback(hObject, eventdata, handles)
% hObject    handle to Tools (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NDyn_Callback(hObject, eventdata, handles)
NeuronDynamic();
% hObject    handle to NDyn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Document_Callback(hObject, eventdata, handles)
web('http://cmplab.sbu.ac.ir/');
% hObject    handle to Document (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
About();
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Export_Callback(hObject, eventdata, handles);
% hObject    handle to Export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Email_Callback(hObject, eventdata, handles)
web('mailto:cmplab@sbu.ac.ir');
% hObject    handle to Email (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Web_Callback(hObject, eventdata, handles)
% hObject    handle to Web (see GCBO)
web('http://cmplab.sbu.ac.ir/');
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Edit_Mean_Final_Dist_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Mean_Final_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Mean_Final_Dist as text
%        str2double(get(hObject,'String')) returns contents of Edit_Mean_Final_Dist as a double


% --- Executes during object creation, after setting all properties.
function Edit_Mean_Final_Dist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Mean_Final_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Varience_Fianl_Dist_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Varience_Fianl_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Varience_Fianl_Dist as text
%        str2double(get(hObject,'String')) returns contents of Edit_Varience_Fianl_Dist as a double


% --- Executes during object creation, after setting all properties.
function Edit_Varience_Fianl_Dist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Varience_Fianl_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_Oscillator_Period_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Oscillator_Period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_Oscillator_Period as text
%        str2double(get(hObject,'String')) returns contents of Edit_Oscillator_Period as a double


% --- Executes during object creation, after setting all properties.
function Edit_Oscillator_Period_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Oscillator_Period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_Final_Dist.
function popup_Final_Dist_Callback(hObject, eventdata, handles)
popup_Distribution_change(handles.popup_Final_Dist,handles,'Final');
% hObject    handle to popup_Final_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_Final_Dist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_Final_Dist


% --- Executes during object creation, after setting all properties.
function popup_Final_Dist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_Final_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupm_Init_Dist.
function popupm_Init_Dist_Callback(hObject, eventdata, handles)
popup_Distribution_change(handles.popupm_Init_Dist,handles,'Initial');
% hObject    handle to popupm_Init_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupm_Init_Dist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupm_Init_Dist


% --- Executes during object creation, after setting all properties.
function popupm_Init_Dist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupm_Init_Dist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Exit_1_Callback(hObject, eventdata, handles)
close();
% hObject    handle to Exit_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function grid1_OnCallback(hObject, eventdata, handles)
% hObject    handle to grid1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid(handles.axes_distribution,'on');
grid(handles.axes_Control,'on');
grid(handles.axes_error,'on');


% --------------------------------------------------------------------
function grid1_OffCallback(hObject, eventdata, handles)
% hObject    handle to grid1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid(handles.axes_distribution,'off');
grid(handles.axes_Control,'off');
grid(handles.axes_error,'off');


% --------------------------------------------------------------------
function grid2_OnCallback(hObject, eventdata, handles)
% hObject    handle to grid2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid(handles.axes_distribution,'minor');
grid(handles.axes_Control,'minor');
grid(handles.axes_error,'minor');


% --------------------------------------------------------------------
function grid2_OffCallback(hObject, eventdata, handles)
% hObject    handle to grid2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid(handles.axes_distribution,'off');
grid(handles.axes_Control,'off');
grid(handles.axes_error,'off');
set(handles.grid1,'State','off');


% --------------------------------------------------------------------
function SaveFigs_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to SaveFigs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figexport1 = figure(1);
set(figexport1,'name','Probability phase distribution','NumberTitle','off');
set(handles.axes_distribution,'units','normalized');
newAxes = copyobj(handles.axes_distribution,figexport1);
set(newAxes,'Position',get(groot,'DefaultAxesPosition'));
figexport2 = figure(2);
set(figexport2,'name','Control input','NumberTitle','off');
set(handles.axes_Control,'units','normalized');
newAxes = copyobj(handles.axes_Control,figexport2);
set(newAxes,'Position',get(groot,'DefaultAxesPosition'));
figexport3 = figure(3);
set(figexport3,'name','Error','NumberTitle','off');
set(handles.axes_error,'units','normalized');
newAxes = copyobj(handles.axes_error,figexport3);
set(newAxes,'Position',get(groot,'DefaultAxesPosition'));
figexport4 = figure(4);
set(figexport4,'name','Phase oscillators','NumberTitle','off');
set(handles.axes_Dsynch,'units','normalized');
newAxes = copyobj(handles.axes_Dsynch,figexport4);
set(newAxes,'Position',get(groot,'DefaultAxesPosition'));


% --------------------------------------------------------------------
function SaveMat_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to SaveMat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% % results=PlotsDynamic(handles);
% % [file,path] = uiputfile('*.mat');
% % if file~=0
% %     save(fullfile(path,file),'results');
% % end
[Dist,Error,Thetas,U,Sim_time,Domain]= Run_test(handles,0);
[file,path] = uiputfile('*.mat');
if file~=0
    save(fullfile(path,file),'Dist','Error','Thetas','U','Sim_time','Domain');
end
% --------------------------------------------------------------------
function Legend1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Legend1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
legend(handles.axes_distribution,{'Current dist.','Desired dist.'},'Location','best')
legend(handles.axes_Dsynch,{'Oscillators','Phase'},'Location','best')
