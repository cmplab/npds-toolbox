% GIVES THE VALUE OF PARAMETERS
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)

% par        Vector contains the values of parameters related to
%            different dynamic models ('Hudgkin-Huxley', 'Thalamic'
%            'Rose-Hindmarsh','FihzHugh-Nagumo') as output

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function par=getparams(handles)
par=zeros(20,1);
contents = get(handles.Popup_Neuron,'String');
val = contents{get(handles.Popup_Neuron,'Value')};
if strcmp(val,'Hudgkin-Huxley')
    par=[str2double(get(handles.EditHHvNa,'String'))
        str2double(get(handles.EditHHvK,'String'))
        str2double(get(handles.EditHHvL,'String'))
        str2double(get(handles.EditHHgNa,'String'))
        str2double(get(handles.EditHHgK,'String'))
        str2double(get(handles.EditHHgL,'String'))
        str2double(get(handles.EditHHC,'String'))
        0;0
        str2double(get(handles.L_current,'String'))
        str2double(get(handles.U_current,'String'))
        str2double(get(handles.IC1_L_edit,'String'))
        str2double(get(handles.IC1_U_edit,'String'))
        str2double(get(handles.IC2_L_edit,'String'))
        str2double(get(handles.IC2_U_edit,'String'))
        str2double(get(handles.IC3_L_edit,'String'))
        str2double(get(handles.IC3_U_edit,'String'))
        str2double(get(handles.IC4_L_edit,'String'))
        str2double(get(handles.IC4_U_edit,'String'))
        str2double(get(handles.Time_edit,'String'))];
elseif strcmp(val,'Thalamic')
    par=[str2double(get(handles.EditTeT,'String'))
        str2double(get(handles.EditTeL,'String'))
        str2double(get(handles.EditTeK,'String'))
        str2double(get(handles.EditTeNa,'String'))
        str2double(get(handles.EditTeC,'String'))
        str2double(get(handles.EditTgT,'String'))
        str2double(get(handles.EditTgL,'String'))
        str2double(get(handles.EditTgK,'String'))
        str2double(get(handles.EdirTgNa,'String'))
        str2double(get(handles.L_current,'String'))
        str2double(get(handles.U_current,'String'))
        str2double(get(handles.IC1_L_edit,'String'))
        str2double(get(handles.IC1_U_edit,'String'))
        str2double(get(handles.IC2_L_edit,'String'))
        str2double(get(handles.IC2_U_edit,'String'))
        str2double(get(handles.IC3_L_edit,'String'))
        str2double(get(handles.IC3_U_edit,'String'))
        0;0
        str2double(get(handles.Time_edit,'String'))];
elseif strcmp(val,'Rose-Hindmarsh')
    par=[str2double(get(handles.EditRHa,'String'))
        str2double(get(handles.EditRHb,'String'))
        str2double(get(handles.EditRHc,'String'))
        str2double(get(handles.EditRHd,'String'))
        str2double(get(handles.EditRHr,'String'))
        str2double(get(handles.EditRHs,'String'))
        str2double(get(handles.EditRHXr,'String'))
        0;0
        str2double(get(handles.L_current,'String'))
        str2double(get(handles.U_current,'String'))
        str2double(get(handles.IC1_L_edit,'String'))
        str2double(get(handles.IC1_U_edit,'String'))
        str2double(get(handles.IC2_L_edit,'String'))
        str2double(get(handles.IC2_U_edit,'String'))
        str2double(get(handles.IC3_L_edit,'String'))
        str2double(get(handles.IC3_U_edit,'String'))
        0;0
        str2double(get(handles.Time_edit,'String'))];
elseif strcmp(val,'FihzHugh-Nagumo')
    par=[str2double(get(handles.EditFHNa,'String'))
        str2double(get(handles.EditFHNb,'String'))
        str2double(get(handles.EditFHNc,'String'))
        0;0;0;0;0;0
        str2double(get(handles.L_current,'String'))
        str2double(get(handles.U_current,'String'))
        str2double(get(handles.IC1_L_edit,'String'))
        str2double(get(handles.IC1_U_edit,'String'))
        str2double(get(handles.IC2_L_edit,'String'))
        str2double(get(handles.IC2_U_edit,'String'))
        0;0;0;0
        str2double(get(handles.Time_edit,'String'))];
end
