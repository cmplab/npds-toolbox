function varargout = NeuronDynamic(varargin)
% NEURONDYNAMIC MATLAB code for NeuronDynamic.fig
%      NEURONDYNAMIC, by itself, creates a new NEURONDYNAMIC or raises the existing
%      singleton*.
%
%      H = NEURONDYNAMIC returns the handle to a new NEURONDYNAMIC or the handle to
%      the existing singleton*.
%
%      NEURONDYNAMIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEURONDYNAMIC.M with the given input arguments.
%
%      NEURONDYNAMIC('Property','Value',...) creates a new NEURONDYNAMIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NeuronDynamic_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NeuronDynamic_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NeuronDynamic

% A guide to the functions embedded in the current code
%   Initialize_Dynamic(..)  The known parameters of the current model are initialized
%   getparams(..)           Gives the value of the parameters of the current model to the output
%   PlotsDynamic(..)        Draw the dynamics of the current model in the dynamic figure
%   PortraiteDynamic(..)    Draw the Portraite of the current model in the Portraite figure
%   Report(..)              Present the current model report in the edit box
%   Popup_changes_init(..)  Initializes the parameters of the current model according to the changes in the pop-up window
%   error_handling(..)      Specifies the type of error that occurred in the parameters
%   Check_inputs(..)        Validates the parameters of the current model and gives the output
%   check_port_eval(..)     Evaluates 2D and 3D portraits with selected dimensions
%   check_port_show(..)     Prevents errors in drawing portraits by locking extra dimensions
%   OK_Panel(..)            Allows you to change the initial condition range, input current range and final time
%   OptionPanelActive(..)   Locks and unlocks sliders according to the option panel
%   show_error(..)          Displays the appropriate message due to the error occurred


% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.m)


% Last Modified by GUIDE v2.5 18-Mar-2021 21:26:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @NeuronDynamic_OpeningFcn, ...
    'gui_OutputFcn',  @NeuronDynamic_OutputFcn, ...
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


% --- Executes just before NeuronDynamic is made visible.
function NeuronDynamic_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NeuronDynamic (see VARARGIN)

% The params vector  contains all the known parameters of the current model
global params
Initialize_Dynamic(handles);
params=getparams(handles);

% Choose default command line output for NeuronDynamic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
tstart=tic;
[answers,dt]=PlotsDynamic(handles);
tend=toc(tstart);
PortraiteDynamic(handles);
Report(handles,answers,dt,tend)



% UIWAIT makes NeuronDynamic wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NeuronDynamic_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Popup_Neuron.
function Popup_Neuron_Callback(hObject, eventdata, handles)
% hObject    handle to Popup_Neuron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model

global params
Popup_changes_init(handles);
params=getparams(handles);
tstart=tic;
[answers,dt]=PlotsDynamic(handles);
tend=toc(tstart);
PortraiteDynamic(handles);
Report(handles,answers,dt,tend)

% Hints: contents = cellstr(get(hObject,'String')) returns Popup_Neuron contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popup_Neuron


% --- Executes during object creation, after setting all properties.
function Popup_Neuron_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popup_Neuron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Slider_exter_current_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_exter_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause(0.1);
set(handles.Edit_exter_current,'String',get(handles.Slider_exter_current,'value'));
valid_inputs=error_handling(handles,'Parameters_input');
if valid_inputs==0
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    PortraiteDynamic(handles);
    Report(handles,answers,dt,tend)
end

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_exter_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_exter_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Edit_exter_current_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_exter_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_input=Check_inputs(handles.Edit_exter_current,'Bounded',handles.L_current,handles.U_current);
set_condition(handles,handles.Edit_exter_current,handles.Slider_exter_current,valid_input);

% Hints: get(hObject,'String') returns contents of Edit_exter_current as text
%        str2double(get(hObject,'String')) returns contents of Edit_exter_current as a double


% --- Executes during object creation, after setting all properties.
function Edit_exter_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_exter_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditHHvNa_Callback(hObject, eventdata, handles)
% error_handling(handles,'Condition_input');
% hObject    handle to EditHHvNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles    structure with handles and user data (see GUIDATA)
% The params vector contains all the known parameters of the current model

global params
valid_input=Check_inputs(hObject,'General');
params(1)=set_params(params(1),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditHHvNa as text
%        str2double(get(hObject,'String')) returns contents of EditHHvNa as a double


% --- Executes during object creation, after setting all properties.
function EditHHvNa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditHHvNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditHHvK_Callback(hObject, eventdata, handles)
% hObject    handle to EditHHvK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(2)=set_params(params(2),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditHHvK as text
%        str2double(get(hObject,'String')) returns contents of EditHHvK as a double


% --- Executes during object creation, after setting all properties.
function EditHHvK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditHHvK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditHHvL_Callback(hObject, eventdata, handles)
% hObject    handle to EditHHvL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(3)=set_params(params(3),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditHHvL as text
%        str2double(get(hObject,'String')) returns contents of EditHHvL as a double


% --- Executes during object creation, after setting all properties.
function EditHHvL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditHHvL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditHHgNa_Callback(hObject, eventdata, handles)
% hObject    handle to EditHHgNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(4)=set_params(params(4),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditHHgNa as text
%        str2double(get(hObject,'String')) returns contents of EditHHgNa as a double


% --- Executes during object creation, after setting all properties.
function EditHHgNa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditHHgNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditHHgK_Callback(hObject, eventdata, handles)
% hObject    handle to EditHHgK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(5)=set_params(params(5),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditHHgK as text
%        str2double(get(hObject,'String')) returns contents of EditHHgK as a double


% --- Executes during object creation, after setting all properties.
function EditHHgK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditHHgK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditHHgL_Callback(hObject, eventdata, handles)
% hObject    handle to EditHHgL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(6)=set_params(params(6),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditHHgL as text
%        str2double(get(hObject,'String')) returns contents of EditHHgL as a double


% --- Executes during object creation, after setting all properties.
function EditHHgL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditHHgL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditHHC_Callback(hObject, eventdata, handles)
% hObject    handle to EditHHC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(7)=set_params(params(7),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditHHC as text
%        str2double(get(hObject,'String')) returns contents of EditHHC as a double


% --- Executes during object creation, after setting all properties.
function EditHHC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditHHC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditTeT_Callback(hObject, eventdata, handles)
% hObject    handle to EditTeT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(1)=set_params(params(1),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditTeT as text
%        str2double(get(hObject,'String')) returns contents of EditTeT as a double


% --- Executes during object creation, after setting all properties.
function EditTeT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditTeT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditTeL_Callback(hObject, eventdata, handles)
% hObject    handle to EditTeL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(2)=set_params(params(2),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditTeL as text
%        str2double(get(hObject,'String')) returns contents of EditTeL as a double


% --- Executes during object creation, after setting all properties.
function EditTeL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditTeL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditTeK_Callback(hObject, eventdata, handles)
% hObject    handle to EditTeK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(3)=set_params(params(3),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditTeK as text
%        str2double(get(hObject,'String')) returns contents of EditTeK as a double


% --- Executes during object creation, after setting all properties.
function EditTeK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditTeK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditTeNa_Callback(hObject, eventdata, handles)
% hObject    handle to EditTeNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(4)=set_params(params(4),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditTeNa as text
%        str2double(get(hObject,'String')) returns contents of EditTeNa as a double


% --- Executes during object creation, after setting all properties.
function EditTeNa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditTeNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditTeC_Callback(hObject, eventdata, handles)
% hObject    handle to EditTeC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(5)=set_params(params(5),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditTeC as text
%        str2double(get(hObject,'String')) returns contents of EditTeC as a double


% --- Executes during object creation, after setting all properties.
function EditTeC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditTeC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditTgT_Callback(hObject, eventdata, handles)
% hObject    handle to EditTgT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(6)=set_params(params(6),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditTgT as text
%        str2double(get(hObject,'String')) returns contents of EditTgT as a double


% --- Executes during object creation, after setting all properties.
function EditTgT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditTgT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditTgL_Callback(hObject, eventdata, handles)
% hObject    handle to EditTgL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(7)=set_params(params(7),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditTgL as text
%        str2double(get(hObject,'String')) returns contents of EditTgL as a double


% --- Executes during object creation, after setting all properties.
function EditTgL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditTgL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditTgK_Callback(hObject, eventdata, handles)
% hObject    handle to EditTgK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(8)=set_params(params(8),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditTgK as text
%        str2double(get(hObject,'String')) returns contents of EditTgK as a double


% --- Executes during object creation, after setting all properties.
function EditTgK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditTgK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EdirTgNa_Callback(hObject, eventdata, handles)
% hObject    handle to EdirTgNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(9)=set_params(params(9),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EdirTgNa as text
%        str2double(get(hObject,'String')) returns contents of EdirTgNa as a double


% --- Executes during object creation, after setting all properties.
function EdirTgNa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EdirTgNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditRHa_Callback(hObject, eventdata, handles)
% hObject    handle to EditRHa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(1)=set_params(params(1),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditRHa as text
%        str2double(get(hObject,'String')) returns contents of EditRHa as a double


% --- Executes during object creation, after setting all properties.
function EditRHa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditRHa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditRHb_Callback(hObject, eventdata, handles)
% hObject    handle to EditRHb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(2)=set_params(params(2),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditRHb as text
%        str2double(get(hObject,'String')) returns contents of EditRHb as a double


% --- Executes during object creation, after setting all properties.
function EditRHb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditRHb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditRHc_Callback(hObject, eventdata, handles)
% hObject    handle to EditRHc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(3)=set_params(params(3),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditRHc as text
%        str2double(get(hObject,'String')) returns contents of EditRHc as a double


% --- Executes during object creation, after setting all properties.
function EditRHc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditRHc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditRHd_Callback(hObject, eventdata, handles)
% hObject    handle to EditRHd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(4)=set_params(params(4),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditRHd as text
%        str2double(get(hObject,'String')) returns contents of EditRHd as a double


% --- Executes during object creation, after setting all properties.
function EditRHd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditRHd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditRHr_Callback(hObject, eventdata, handles)
% hObject    handle to EditRHr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(5)=set_params(params(5),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditRHr as text
%        str2double(get(hObject,'String')) returns contents of EditRHr as a double


% --- Executes during object creation, after setting all properties.
function EditRHr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditRHr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditRHs_Callback(hObject, eventdata, handles)
% hObject    handle to EditRHs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(6)=set_params(params(6),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditRHs as text
%        str2double(get(hObject,'String')) returns contents of EditRHs as a double


% --- Executes during object creation, after setting all properties.
function EditRHs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditRHs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditRHXr_Callback(hObject, eventdata, handles)
% hObject    handle to EditRHXr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(7)=set_params(params(7),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditRHXr as text
%        str2double(get(hObject,'String')) returns contents of EditRHXr as a double


% --- Executes during object creation, after setting all properties.
function EditRHXr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditRHXr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditFHNa_Callback(hObject, eventdata, handles)
% hObject    handle to EditFHNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(1)=set_params(params(1),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditFHNa as text
%        str2double(get(hObject,'String')) returns contents of EditFHNa as a double


% --- Executes during object creation, after setting all properties.
function EditFHNa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditFHNa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditFHNb_Callback(hObject, eventdata, handles)
% hObject    handle to EditFHNb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(2)=set_params(params(2),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditFHNb as text
%        str2double(get(hObject,'String')) returns contents of EditFHNb as a double


% --- Executes during object creation, after setting all properties.
function EditFHNb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditFHNb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditFHNc_Callback(hObject, eventdata, handles)
% hObject    handle to EditFHNc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'General');
params(3)=set_params(params(3),hObject,handles,valid_input);

% Hints: get(hObject,'String') returns contents of EditFHNc as text
%        str2double(get(hObject,'String')) returns contents of EditFHNc as a double


% --- Executes during object creation, after setting all properties.
function EditFHNc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditFHNc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Slider_initcond1_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_initcond1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause(0.1);
set(handles.Editnitcond1,'String',get(handles.Slider_initcond1,'value'));
valid_inputs=error_handling(handles,'Parameters_input');
if valid_inputs==0
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    PortraiteDynamic(handles);
    Report(handles,answers,dt,tend)
end

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_initcond1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_initcond1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Editnitcond1_Callback(hObject, eventdata, handles)
% hObject    handle to Editnitcond1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_input=Check_inputs(handles.Editnitcond1,'Bounded',handles.IC1_L_edit,handles.IC1_U_edit);
set_condition(handles,handles.Editnitcond1,handles.Slider_initcond1,valid_input);

% Hints: get(hObject,'String') returns contents of Editnitcond1 as text
%        str2double(get(hObject,'String')) returns contents of Editnitcond1 as a double


% --- Executes during object creation, after setting all properties.
function Editnitcond1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Editnitcond1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Slider_initcond2_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_initcond2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause(0.1);
set(handles.Editnitcond2,'String',get(handles.Slider_initcond2,'value'));
valid_inputs=error_handling(handles,'Parameters_input');
if valid_inputs==0
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    PortraiteDynamic(handles);
    Report(handles,answers,dt,tend)
end

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_initcond2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_initcond2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Editnitcond2_Callback(hObject, eventdata, handles)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_input=Check_inputs(handles.Editnitcond2,'Bounded',handles.IC2_L_edit,handles.IC2_U_edit);
set_condition(handles,handles.Editnitcond2,handles.Slider_initcond2,valid_input);

% Hints: get(hObject,'String') returns contents of Editnitcond2 as text
%        str2double(get(hObject,'String')) returns contents of Editnitcond2 as a double


% --- Executes during object creation, after setting all properties.
function Editnitcond2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Editnitcond2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Slider_initcond3_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_initcond3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause(0.1);
set(handles.Editnitcond3,'String',get(handles.Slider_initcond3,'value'));
valid_inputs=error_handling(handles,'Parameters_input');
if valid_inputs==0
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    PortraiteDynamic(handles);
    Report(handles,answers,dt,tend)
end

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_initcond3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_initcond3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Editnitcond3_Callback(hObject, eventdata, handles)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_input=Check_inputs(handles.Editnitcond3,'Bounded',handles.IC3_L_edit,handles.IC3_U_edit);
set_condition(handles,handles.Editnitcond3,handles.Slider_initcond3,valid_input);

% Hints: get(hObject,'String') returns contents of Editnitcond3 as text
%        str2double(get(hObject,'String')) returns contents of Editnitcond3 as a double


% --- Executes during object creation, after setting all properties.
function Editnitcond3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Editnitcond3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Slider_initcond4_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_initcond4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause(0.1);
set(handles.Editnitcond4,'String',get(handles.Slider_initcond4,'value'));
valid_inputs=error_handling(handles,'Parameters_input');
if valid_inputs==0
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    PortraiteDynamic(handles);
    Report(handles,answers,dt,tend)
end

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_initcond4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_initcond4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Editnitcond4_Callback(hObject, eventdata, handles)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_input=Check_inputs(handles.Editnitcond4,'Bounded',handles.IC4_L_edit,handles.IC4_U_edit);
set_condition(handles,handles.Editnitcond4,handles.Slider_initcond4,valid_input);

% Hints: get(hObject,'String') returns contents of Editnitcond4 as text
%        str2double(get(hObject,'String')) returns contents of Editnitcond4 as a double


% --- Executes during object creation, after setting all properties.
function Editnitcond4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Editnitcond4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Check_plot1.
function Check_plot1_Callback(hObject, eventdata, handles)
% hObject    handle to Check_plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_inputs=error_handling(handles,'Parameters_input');
handle_checkplot(valid_inputs,hObject,handles);

% Hint: get(hObject,'Value') returns toggle state of Check_plot1


% --- Executes on button press in Check_plot2.
function Check_plot2_Callback(hObject, eventdata, handles)
% hObject    handle to Check_plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_inputs=error_handling(handles,'Parameters_input');
handle_checkplot(valid_inputs,hObject,handles);

% Hint: get(hObject,'Value') returns toggle state of Check_plot2


% --- Executes on button press in Check_plot3.
function Check_plot3_Callback(hObject, eventdata, handles)
% hObject    handle to Check_plot3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_inputs=error_handling(handles,'Parameters_input');
handle_checkplot(valid_inputs,hObject,handles);


% Hint: get(hObject,'Value') returns toggle state of Check_plot3


% --- Executes on button press in Check_plot4.
function Check_plot4_Callback(hObject, eventdata, handles)
% hObject    handle to Check_plot4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_inputs=error_handling(handles,'Parameters_input');
handle_checkplot(valid_inputs,hObject,handles);

% Hint: get(hObject,'Value') returns toggle state of Check_plot4


% --- Executes on button press in Check_scale.
function Check_scale_Callback(hObject, eventdata, handles)
% hObject    handle to Check_scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_inputs=error_handling(handles,'Parameters_input');
handle_checkplot(valid_inputs,hObject,handles);


% Hint: get(hObject,'Value') returns toggle state of Check_scale


% --- Executes on button press in Check_3D.
function Check_3D_Callback(hObject, eventdata, handles)
% hObject    handle to Check_3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valid_inputs=error_handling(handles,'Parameters_input');
if valid_inputs~=0
    if ~get(handles.Check_3D,'value')
        set(hObject,'Value',0);
        check_port_eval(handles);
        show_error(valid_inputs);
    elseif get(handles.Check_3D,'value')
        set(hObject,'Value',1);
        check_port_eval(handles);
        show_error(valid_inputs);
    end
elseif valid_inputs==0
    if ~get(handles.Check_3D,'value')
        check_port_eval(handles);
        PortraiteDynamic(handles);
    else
        check_port_eval(handles)
    end
end

% Hint: get(hObject,'Value') returns toggle state of Check_3D


% --- Executes on button press in Check_port1.
function Check_port1_Callback(hObject, eventdata, handles)
% hObject    handle to Check_port1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run=check_port_eval(handles);
valid_inputs=error_handling(handles,'Parameters_input');
handl_checkport(valid_inputs,run,hObject,handles)

% Hint: get(hObject,'Value') returns toggle state of Check_port1


% --- Executes on button press in Check_port2.
function Check_port2_Callback(hObject, eventdata, handles)
% hObject    handle to Check_port2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run=check_port_eval(handles);
valid_inputs=error_handling(handles,'Parameters_input');
handl_checkport(valid_inputs,run,hObject,handles)

% Hint: get(hObject,'Value') returns toggle state of Check_port2


% --- Executes on button press in Check_port3.
function Check_port3_Callback(hObject, eventdata, handles)
% hObject    handle to Check_port3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run=check_port_eval(handles);
valid_inputs=error_handling(handles,'Parameters_input');
handl_checkport(valid_inputs,run,hObject,handles)

% Hint: get(hObject,'Value') returns toggle state of Check_port3


% --- Executes on button press in Check_port4.
function Check_port4_Callback(hObject, eventdata, handles)
% hObject    handle to Check_port4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run=check_port_eval(handles);
valid_inputs=error_handling(handles,'Parameters_input');
handl_checkport(valid_inputs,run,hObject,handles)

% Hint: get(hObject,'Value') returns toggle state of Check_port4


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Slider_exter_current.
function Slider_exter_current_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Slider_exter_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function grid1_OffCallback(hObject, eventdata, handles)
% hObject    handle to grid1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid(handles.Axes_Dynamic,'off');
grid(handles.Axes_Phase,'off');


% --------------------------------------------------------------------
function grid1_OnCallback(hObject, eventdata, handles)
% hObject    handle to grid1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid(handles.Axes_Dynamic,'on');
grid(handles.Axes_Phase,'on');


% --------------------------------------------------------------------
function grid2_OffCallback(hObject, eventdata, handles)
% hObject    handle to grid2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid(handles.Axes_Dynamic,'off');
grid(handles.Axes_Phase,'off');
set(handles.grid1,'State','off');


% --------------------------------------------------------------------
function grid2_OnCallback(hObject, eventdata, handles)
% hObject    handle to grid2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grid(handles.Axes_Dynamic,'minor');
grid(handles.Axes_Phase,'minor');



function L_current_Callback(hObject, eventdata, handles)
% hObject    handle to L_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'Lbounded',handles.U_current);
params(10)=set_boundaries(params(10),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of L_current as text
%        str2double(get(hObject,'String')) returns contents of L_current as a double


% --- Executes during object creation, after setting all properties.
function L_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% hObject    handle to U_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of U_current as text
%        str2double(get(hObject,'String')) returns contents of U_current as a double


% --- Executes during object creation, after setting all properties.
function U_current_CreateFcn(hObject, eventdata, handles)
% hObject    handle to U_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function U_current_Callback(hObject, eventdata, handles)
% hObject    handle to U_current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_input=Check_inputs(hObject,'Ubounded',handles.L_current);
params(11)=set_boundaries(params(11),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of U_current as text
%        str2double(get(hObject,'String')) returns contents of U_current as a double


function IC1_L_edit_Callback(hObject, eventdata, handles)
% hObject    handle to IC1_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_input=Check_inputs(hObject,'Lbounded',handles.IC1_U_edit);
params(12)=set_boundaries(params(12),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of IC1_L_edit as text
%        str2double(get(hObject,'String')) returns contents of IC1_L_edit as a double


% --- Executes during object creation, after setting all properties.
function IC1_L_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IC1_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IC1_U_edit_Callback(hObject, eventdata, handles)
% hObject    handle to IC1_U_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_input=Check_inputs(hObject,'Ubounded',handles.IC1_L_edit);
params(13)=set_boundaries(params(13),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of IC1_U_edit as text
%        str2double(get(hObject,'String')) returns contents of IC1_U_edit as a double


% --- Executes during object creation, after setting all properties.
function IC1_U_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IC1_U_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IC2_L_edit_Callback(hObject, eventdata, handles)
% hObject    handle to IC2_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_input=Check_inputs(hObject,'Lbounded',handles.IC2_U_edit);
params(14)=set_boundaries(params(14),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of IC2_L_edit as text
%        str2double(get(hObject,'String')) returns contents of IC2_L_edit as a double


% --- Executes during object creation, after setting all properties.
function IC2_L_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IC2_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IC2_U_edit_Callback(hObject, eventdata, handles)
% hObject    handle to IC2_U_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_input=Check_inputs(hObject,'Ubounded',handles.IC2_L_edit);
params(15)=set_boundaries(params(15),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of IC2_U_edit as text
%        str2double(get(hObject,'String')) returns contents of IC2_U_edit as a double


% --- Executes during object creation, after setting all properties.
function IC2_U_edit_CreateFcn(hObject, eventdata, handles)

% hObject    handle to IC2_U_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IC3_L_edit_Callback(hObject, eventdata, handles)
% hObject    handle to IC3_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_input=Check_inputs(hObject,'Lbounded',handles.IC3_U_edit);
params(16)=set_boundaries(params(16),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of IC3_L_edit as text
%        str2double(get(hObject,'String')) returns contents of IC3_L_edit as a double


% --- Executes during object creation, after setting all properties.
function IC3_L_edit_CreateFcn(hObject, eventdata, handles)

% hObject    handle to IC3_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IC3_U_edit_Callback(hObject, eventdata, handles)
% hObject    handle to IC3_U_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_input=Check_inputs(hObject,'Ubounded',handles.IC3_L_edit);
params(17)=set_boundaries(params(17),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of IC3_U_edit as text
%        str2double(get(hObject,'String')) returns contents of IC3_U_edit as a double


% --- Executes during object creation, after setting all properties.
function IC3_U_edit_CreateFcn(hObject, eventdata, handles)

% hObject    handle to IC3_U_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IC4_L_edit_Callback(hObject, eventdata, handles)
% hObject    handle to IC4_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_input=Check_inputs(hObject,'Lbounded',handles.IC4_U_edit);
params(18)=set_boundaries(params(18),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of IC4_L_edit as text
%        str2double(get(hObject,'String')) returns contents of IC4_L_edit as a double


% --- Executes during object creation, after setting all properties.
function IC4_L_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IC4_L_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IC4_U_edit_Callback(hObject, eventdata, handles)
% hObject    handle to IC4_U_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_input=Check_inputs(hObject,'Ubounded',handles.IC4_L_edit);
params(19)=set_boundaries(params(19),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of IC4_U_edit as text
%        str2double(get(hObject,'String')) returns contents of IC4_U_edit as a double


% --- Executes during object creation, after setting all properties.
function IC4_U_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IC4_U_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OK_Opt.
function OK_Opt_Callback(hObject, eventdata, handles)
% hObject    handle to OK_Opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params;
valid_inputs=error_handling(handles,'Boundary_inputs');
if valid_inputs==0
    OK_Panel(handles);
    OptionPanelActive(handles,'on');
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    PortraiteDynamic(handles);
    Report(handles,answers,dt,tend)
end


% --------------------------------------------------------------------
function Edir_range_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Edir_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Edir_range_OffCallback(hObject, eventdata, handles)
% hObject    handle to Edir_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
% global params;
valid_inputs=error_handling(handles,'Boundary_inputs');
if valid_inputs==0
    OK_Panel(handles);
    OptionPanelActive(handles,'on');
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    PortraiteDynamic(handles);
    Report(handles,answers,dt,tend)
    set(handles.OptionPanel,'visible','off');
    OptionPanelActive(handles,'on');
else
    set(handles.Edir_range,'State','on');
end
set(handles.Panel_Neuron,'title','Neuron type');



% --------------------------------------------------------------------
function Edir_range_OnCallback(hObject, eventdata, handles)
% hObject    handle to Edir_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.OptionPanel,'visible','on');
set(handles.Panel_Neuron,'title','Set domain');
OptionPanelActive(handles,'off');



function Time_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Time_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The params vector  contains all the known parameters of the current model
global params
valid_input=Check_inputs(hObject,'Time');
params(20)=set_boundaries(params(20),hObject,valid_input);

% Hints: get(hObject,'String') returns contents of Time_edit as text
%        str2double(get(hObject,'String')) returns contents of Time_edit as a double


% --- Executes during object creation, after setting all properties.
function Time_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Time_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uitoggletool1_OnCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function legendbar_OffCallback(hObject, eventdata, handles)
% hObject    handle to legendbar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function legendbar_OnCallback(hObject, eventdata, handles)
% hObject    handle to legendbar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function rotatetoggle_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to rotatetoggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Phasetoggle_OnCallback(hObject, eventdata, handles)
% hObject    handle to Phasetoggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Axes_Phase,'visible','on');
h1 = get(handles.Axes_Phase,'children');
set(h1,'visible','on');
set(handles.strtoggletool,'Enable','on');
set(handles.vftoggletool,'Enable','on');
PortraiteDynamic(handles);
% Report(handles)
set(handles.Axes_Dynamic,'position',[10.142857142857142,11.235294117647058,64.57142857142857,25.470588235294116]);
check_port_show(handles,1);

% --------------------------------------------------------------------
function Phasetoggle_OffCallback(hObject, eventdata, handles)
% hObject    handle to Phasetoggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Axes_Phase,'visible','off');
h1 = get(handles.Axes_Phase,'children');
set(h1,'visible','off');
set(handles.strtoggletool,'Enable','off');
set(handles.vftoggletool,'Enable','off');
set(handles.Axes_Dynamic,'position',[10.142857142857142,11.235294117647058,133.57142857142856,25.470588235294116]);
check_port_show(handles,0);


% --------------------------------------------------------------------
function EFpushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to EFpushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figexport1 = figure(1);
set(figexport1,'name','Dynamic','NumberTitle','off');
set(handles.Axes_Dynamic,'units','normalized');
newAxes = copyobj(handles.Axes_Dynamic,figexport1);
set(newAxes,'Position',get(groot,'DefaultAxesPosition'));
state=get(handles.Phasetoggle,'state');
if state(2)=='n'
    figexport2 = figure(2);
    set(figexport2,'name','Portraite','NumberTitle','off');
    set(handles.Axes_Phase,'units','normalized');
    newAxes = copyobj(handles.Axes_Phase,figexport2);
    set(newAxes,'Position',get(groot,'DefaultAxesPosition'));
end
set(handles.Axes_Dynamic,'units','characters');
set(handles.Axes_Phase,'units','characters');


% --------------------------------------------------------------------
function vftoggletool_OffCallback(hObject, eventdata, handles)
% hObject    handle to vftoggletool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% valid_boundary=error_handling(handles,'Boundary_inputs');
% valid_parameters=error_handling(handles,'Parameters_input');
% if valid_boundary~=0 || valid_parameters~=0
%    set(handles.strtoggletool,'Enable','off');
%    set(hObject,'State','on');
% else
%     set(handles.strtoggletool,'Enable','on');
%     PortraiteDynamic(handles);
%     Report(handles)
% end


% --------------------------------------------------------------------
function vftoggletool_OnCallback(hObject, eventdata, handles)
% hObject    handle to vftoggletool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%    valid_boundary=error_handling(handles,'Boundary_inputs');
% valid_parameters=error_handling(handles,'Parameters_input');
% if valid_boundary==0 || valid_parameters~=0
%    set(handles.strtoggletool,'Enable','on');
%    set(hObject,'State','off');
% else
%     set(handles.strtoggletool,'Enable','off');
%     PortraiteDynamic(handles);
%     Report(handles)
% end
%

% --------------------------------------------------------------------
function strtoggletool_OffCallback(hObject, eventdata, handles)
% hObject    handle to strtoggletool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function strtoggletool_OnCallback(hObject, eventdata, handles)
% hObject    handle to strtoggletool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function rttoggletool12_OffCallback(hObject, eventdata, handles)
% hObject    handle to rttoggletool12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function rttoggletool12_OnCallback(hObject, eventdata, handles)
% hObject    handle to rttoggletool12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function SaveMat_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to SaveMat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
results=PlotsDynamic(handles);
[file,path] = uiputfile('*.mat');
if file~=0
    save(fullfile(path,file),'results');
end

function output=set_params(param,hObject,handles,valid_input)
% param      recent values of known model parameters
% hObject    handle to set_params (see GCBO)
% handles    structure with handles and user data (see GUIDATA)
%valid_input error flag and its type
if valid_input~=0
    show_error(valid_input);
    set(hObject,'String',param);
    output=param;
else
    output=str2double(get(hObject,'String'));
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    PortraiteDynamic(handles);
    Report(handles,answers,dt,tend)
    
end

function output=set_boundaries(param,hObject,valid_input)
% param      recent values of known model parameters
% hObject    handle to set_params (see GCBO)
%valid_input error flag and its type
if valid_input~=0
    show_error(valid_input);
    set(hObject,'String',param);
    output=param;
else
    output=str2double(get(hObject,'String'));
end

function set_condition(handles,Edithandle,Slidehandle,valid_input)
% handles    structure with handles and user data (see GUIDATA)
%Slidehandle specific slider handle
%Edithandle  specific editbox handle
%valid_input error flag and its type
if valid_input~=0
    show_error(valid_input);
    set(Edithandle,'String',num2str(get(Slidehandle,'value')));
else
    set(Slidehandle,'value',str2double(get(Edithandle,'String')));
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    PortraiteDynamic(handles);
    Report(handles,answers,dt,tend)
    
end



function handl_checkport(valid_inputs,run,hObject,handles)
% valid_input error flag and its type
% run        Portrit execution controller
% hObject    handle to set_params (see GCBO)
% handles    structure with handles and user data (see GUIDATA)
if valid_inputs~=0 && run
    set(hObject,'Value',0);
    show_error(valid_inputs);
elseif valid_inputs~=0 && ~run
    set(hObject,'Value',1);
    show_error(valid_inputs);
elseif valid_inputs==0 && run
    PortraiteDynamic(handles);
end


function handle_checkplot(valid_inputs,hObject,handles)
% valid_input error flag and its type
% hObject    handle to set_params (see GCBO)
% handles    structure with handles and user data (see GUIDATA)
if valid_inputs==0
    tstart=tic;
    [answers,dt]=PlotsDynamic(handles);
    tend=toc(tstart);
    Report(handles,answers,dt,tend);
elseif valid_inputs~=0
    if ~get(hObject,'value')
        set(hObject,'Value',1);
    elseif get(hObject,'value')
        set(hObject,'Value',0);
    end
end





% --- Executes on key press with focus on Slider_exter_current and none of its controls.
function Slider_exter_current_KeyPressFcn(hObject, eventdata, handles)

% hObject    handle to Slider_exter_current (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function vftoggletool_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to vftoggletool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(hObject,'State'),'on')
    toggletool_handle(hObject,handles.strtoggletool,handles,'on','off')
elseif strcmp(get(hObject,'State'),'off')
    toggletool_handle(hObject,handles.strtoggletool,handles,'off','on')
end

function toggletool_handle(hObject1,hObject2,handles,mode1,mode2)
valid_boundary=error_handling(handles,'Boundary_inputs');
valid_parameters=error_handling(handles,'Parameters_input');
if valid_boundary~=0 || valid_parameters~=0
    set(hObject2,'Enable', mode1);
    set(hObject1,'State', mode2);
else
    set(hObject2,'Enable', mode2);
    PortraiteDynamic(handles);
end


% --------------------------------------------------------------------
function strtoggletool_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to strtoggletool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(get(hObject,'State'),'on')
    toggletool_handle(hObject,handles.vftoggletool,handles,'on','off')
elseif strcmp(get(hObject,'State'),'off')
    toggletool_handle(hObject,handles.vftoggletool,handles,'off','on')
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
