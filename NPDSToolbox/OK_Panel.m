% MODIFY BOUNDARIES AND FINAL TIME
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)

%   By clicking the OK button in the options panel,
%   this code sets the modified range and final time
%   on the sliders and figures, respectively.

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function OK_Panel(handles)
contents = get(handles.Popup_Neuron,'String');
val = contents{get(handles.Popup_Neuron,'Value')};
set(handles.Text_Analyse,'String',val);
if strcmp(val,'Hudgkin-Huxley')
    set(handles.Edit_exter_current,'string',num2str(get(handles.Slider_exter_current,'min')));
    set(handles.Editnitcond1,'string',get(handles.Slider_initcond1,'min'));
    set(handles.Editnitcond2,'string',get(handles.Slider_initcond2,'min'));
    set(handles.Editnitcond3,'string',get(handles.Slider_initcond3,'min'));
    set(handles.Editnitcond4,'string',get(handles.Slider_initcond4,'min'));
    set(handles.Slider_exter_current,'min',str2double(get(handles.L_current,'string')));
    set(handles.Slider_exter_current,'value',str2double(get(handles.L_current,'string')));
    set(handles.Slider_exter_current,'max',str2double(get(handles.U_current,'string')));
    set(handles.Slider_initcond1,'min',str2double(get(handles.IC1_L_edit,'string')));
    set(handles.Slider_initcond1,'value',str2double(get(handles.IC1_L_edit,'string')));
    set(handles.Slider_initcond1,'max',str2double(get(handles.IC1_U_edit,'string')));
    set(handles.Slider_initcond2,'min',str2double(get(handles.IC2_L_edit,'string')));
    set(handles.Slider_initcond2,'value',str2double(get(handles.IC2_L_edit,'string')));
    set(handles.Slider_initcond2,'max',str2double(get(handles.IC2_U_edit,'string')));
    set(handles.Slider_initcond3,'min',str2double(get(handles.IC3_L_edit,'string')));
    set(handles.Slider_initcond3,'value',str2double(get(handles.IC3_L_edit,'string')));
    set(handles.Slider_initcond3,'max',str2double(get(handles.IC3_U_edit,'string')));
    set(handles.Slider_initcond4,'min',str2double(get(handles.IC4_L_edit,'string')));
    set(handles.Slider_initcond4,'value',str2double(get(handles.IC4_L_edit,'string')));
    set(handles.Slider_initcond4,'max',str2double(get(handles.IC4_U_edit,'string')));
elseif strcmp(val,'FihzHugh-Nagumo')
    set(handles.Edit_exter_current,'string',get(handles.L_current,'string'));
    set(handles.Editnitcond1,'string',get(handles.IC1_L_edit,'string'));
    set(handles.Editnitcond2,'string',get(handles.IC2_L_edit,'string'));
    set(handles.Slider_exter_current,'min',str2double(get(handles.L_current,'string')));
    set(handles.Slider_exter_current,'value',str2double(get(handles.L_current,'string')));
    set(handles.Slider_exter_current,'max',str2double(get(handles.U_current,'string')));
    set(handles.Slider_initcond1,'min',str2double(get(handles.IC1_L_edit,'string')));
    set(handles.Slider_initcond1,'value',str2double(get(handles.IC1_L_edit,'string')));
    set(handles.Slider_initcond1,'max',str2double(get(handles.IC1_U_edit,'string')));
    set(handles.Slider_initcond2,'min',str2double(get(handles.IC2_L_edit,'string')));
    set(handles.Slider_initcond2,'value',str2double(get(handles.IC2_L_edit,'string')));
    set(handles.Slider_initcond2,'max',str2double(get(handles.IC2_U_edit,'string')));
elseif strcmp(val,'Rose-Hindmarsh')
    set(handles.Edit_exter_current,'string',get(handles.L_current,'string'));
    set(handles.Editnitcond1,'string',get(handles.IC1_L_edit,'string'));
    set(handles.Editnitcond2,'string',get(handles.IC2_L_edit,'string'));
    set(handles.Editnitcond3,'string',get(handles.IC3_L_edit,'string'));
    set(handles.Slider_exter_current,'min',str2double(get(handles.L_current,'string')));
    set(handles.Slider_exter_current,'value',str2double(get(handles.L_current,'string')));
    set(handles.Slider_exter_current,'max',str2double(get(handles.U_current,'string')));
    set(handles.Slider_initcond1,'min',str2double(get(handles.IC1_L_edit,'string')));
    set(handles.Slider_initcond1,'value',str2double(get(handles.IC1_L_edit,'string')));
    set(handles.Slider_initcond1,'max',str2double(get(handles.IC1_U_edit,'string')));
    set(handles.Slider_initcond2,'min',str2double(get(handles.IC2_L_edit,'string')));
    set(handles.Slider_initcond2,'value',str2double(get(handles.IC2_L_edit,'string')));
    set(handles.Slider_initcond2,'max',str2double(get(handles.IC2_U_edit,'string')));
    set(handles.Slider_initcond3,'min',str2double(get(handles.IC3_L_edit,'string')));
    set(handles.Slider_initcond3,'value',str2double(get(handles.IC3_L_edit,'string')));
    set(handles.Slider_initcond3,'max',str2double(get(handles.IC3_U_edit,'string')));
elseif strcmp(val,'Thalamic')
    set(handles.Edit_exter_current,'string',get(handles.L_current,'string'));
    set(handles.Editnitcond1,'string',get(handles.IC1_L_edit,'string'));
    set(handles.Editnitcond2,'string',get(handles.IC2_L_edit,'string'));
    set(handles.Editnitcond3,'string',get(handles.IC3_L_edit,'string'));
    set(handles.Editnitcond4,'string',get(handles.IC4_L_edit,'string'));
    set(handles.Slider_exter_current,'min',str2double(get(handles.L_current,'string')));
    set(handles.Slider_exter_current,'value',str2double(get(handles.L_current,'string')));
    set(handles.Slider_exter_current,'max',str2double(get(handles.U_current,'string')));
    set(handles.Slider_initcond1,'min',str2double(get(handles.IC1_L_edit,'string')));
    set(handles.Slider_initcond1,'value',str2double(get(handles.IC1_L_edit,'string')));
    set(handles.Slider_initcond1,'max',str2double(get(handles.IC1_U_edit,'string')));
    set(handles.Slider_initcond2,'min',str2double(get(handles.IC2_L_edit,'string')));
    set(handles.Slider_initcond2,'value',str2double(get(handles.IC2_L_edit,'string')));
    set(handles.Slider_initcond2,'max',str2double(get(handles.IC2_U_edit,'string')));
    set(handles.Slider_initcond3,'min',str2double(get(handles.IC3_L_edit,'string')));
    set(handles.Slider_initcond3,'value',str2double(get(handles.IC3_L_edit,'string')));
    set(handles.Slider_initcond3,'max',str2double(get(handles.IC3_U_edit,'string')));
    set(handles.Slider_initcond4,'min',str2double(get(handles.IC4_L_edit,'string')));
    set(handles.Slider_initcond4,'value',str2double(get(handles.IC4_L_edit,'string')));
    set(handles.Slider_initcond4,'max',str2double(get(handles.IC4_U_edit,'string')));
end
set(handles.OptionPanel,'visible','off');
set(handles.Edir_range,'State','off');
