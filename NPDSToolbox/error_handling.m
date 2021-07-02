% HANDLING THE OCCURED ERROR
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% type       Input modes for error handling
% valid      The sum of the errors occurred as the error output number

% -----type argument modes-----
%       1- type = 'Boundary_inputs'     In this case, according to the related
%                                       dynamic model, it checks the edit boxes
%                                       and the time edit box in option panel
%                                       to check its validity (see Check_inputs(..)).
%       2- type = 'Parameters_input'    In this case, according to the related
%                                       dynamic model, it checks the edit boxes
%                                       in neuron type panel to check its
%                                       validity (see Check_inputs(..)).
% -----------------------------
% -----possible valid output-----
%       1- valid = 0                    There is no error
%       2- valid = 1                    Invalid slider boundaries
%       3- valid = 2                    Invalid checkboxes
%       4- valid = 3                    Invalid final time input
% -------------------------------


% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function valid=error_handling(handles,type)
valid=0;
contents = get(handles.Popup_Neuron,'String');
neuron = contents{get(handles.Popup_Neuron,'Value')};
if strcmp(neuron,'Hudgkin-Huxley')
    if strcmp(type,'Boundary_inputs')
        valid_input=[Check_inputs(handles.L_current,'Lbounded',handles.U_current)
            Check_inputs(handles.IC1_L_edit,'Lbounded',handles.IC1_U_edit)
            Check_inputs(handles.IC2_L_edit,'Lbounded',handles.IC2_U_edit)
            Check_inputs(handles.IC3_L_edit,'Lbounded',handles.IC3_U_edit)
            Check_inputs(handles.IC4_L_edit,'Lbounded',handles.IC4_U_edit)
            Check_inputs(handles.U_current,'Rbounded',handles.L_current)
            Check_inputs(handles.IC1_U_edit,'Rbounded',handles.IC1_L_edit)
            Check_inputs(handles.IC2_U_edit,'Rbounded',handles.IC2_L_edit)
            Check_inputs(handles.IC3_U_edit,'Rbounded',handles.IC3_L_edit)
            Check_inputs(handles.IC4_U_edit,'Rbounded',handles.IC4_L_edit)
            Check_inputs(handles.Time_edit,'Time')];
    elseif strcmp(type,'Parameters_input')
        valid_input=[Check_inputs(handles.EditHHvNa,'General','L')
            Check_inputs(handles.EditHHvK,'General','L')
            Check_inputs(handles.EditHHvL,'General','L')
            Check_inputs(handles.EditHHgNa,'General','L')
            Check_inputs(handles.EditHHgK,'General','L')
            Check_inputs(handles.EditHHgL,'General','L')
            Check_inputs(handles.EditHHC,'General','L')];
    end
elseif strcmp(neuron,'FihzHugh-Nagumo')
    if strcmp(type,'Boundary_inputs')
        valid_input=[Check_inputs(handles.L_current,'Lbounded',handles.U_current)
            Check_inputs(handles.IC1_L_edit,'Lbounded',handles.IC1_U_edit)
            Check_inputs(handles.IC2_L_edit,'Lbounded',handles.IC2_U_edit)
            Check_inputs(handles.U_current,'Rbounded',handles.L_current)
            Check_inputs(handles.IC1_U_edit,'Rbounded',handles.IC1_L_edit)
            Check_inputs(handles.IC2_U_edit,'Rbounded',handles.IC2_L_edit)
            Check_inputs(handles.Time_edit,'Time')];
    elseif strcmp(type,'Parameters_input')
        valid_input=[Check_inputs(handles.EditFHNa,'General')
            Check_inputs(handles.EditFHNb,'General')
            Check_inputs(handles.EditFHNc,'General')];
        
    end
elseif strcmp(neuron,'Rose-Hindmarsh')
    if strcmp(type,'Boundary_inputs')
        valid_input=[Check_inputs(handles.L_current,'Lbounded',handles.U_current)
            Check_inputs(handles.IC1_L_edit,'Lbounded',handles.IC1_U_edit)
            Check_inputs(handles.IC2_L_edit,'Lbounded',handles.IC2_U_edit)
            Check_inputs(handles.IC3_L_edit,'Lbounded',handles.IC3_U_edit)
            Check_inputs(handles.U_current,'Rbounded',handles.L_current)
            Check_inputs(handles.IC1_U_edit,'Rbounded',handles.IC1_L_edit)
            Check_inputs(handles.IC2_U_edit,'Rbounded',handles.IC2_L_edit)
            Check_inputs(handles.IC3_U_edit,'Rbounded',handles.IC3_L_edit)
            Check_inputs(handles.Time_edit,'Time')];
    elseif strcmp(type,'Parameters_input')
        valid_input=[Check_inputs(handles.EditRHa,'General')
            Check_inputs(handles.EditRHb,'General')
            Check_inputs(handles.EditRHc,'General')
            Check_inputs(handles.EditRHd,'General')
            Check_inputs(handles.EditRHr,'General')
            Check_inputs(handles.EditRHs,'General')
            Check_inputs(handles.EditRHXr,'General')];
    end
elseif strcmp(neuron,'Thalamic')
    if strcmp(type,'Boundary_inputs')
        valid_input=[Check_inputs(handles.L_current,'Lbounded',handles.U_current)
            Check_inputs(handles.IC1_L_edit,'Lbounded',handles.IC1_U_edit)
            Check_inputs(handles.IC2_L_edit,'Lbounded',handles.IC2_U_edit)
            Check_inputs(handles.IC3_L_edit,'Lbounded',handles.IC3_U_edit)
            Check_inputs(handles.U_current,'Rbounded',handles.L_current)
            Check_inputs(handles.IC1_U_edit,'Rbounded',handles.IC1_L_edit)
            Check_inputs(handles.IC2_U_edit,'Rbounded',handles.IC2_L_edit)
            Check_inputs(handles.IC3_U_edit,'Rbounded',handles.IC3_L_edit)
            Check_inputs(handles.Time_edit,'Time')];
    elseif strcmp(type,'Parameters_input')
        valid_input=[Check_inputs(handles.EditTeT,'General')
            Check_inputs(handles.EditTeL,'General')
            Check_inputs(handles.EditTeK,'General')
            Check_inputs(handles.EditTeNa,'General')
            Check_inputs(handles.EditTeC,'General')
            Check_inputs(handles.EditTgT,'General')
            Check_inputs(handles.EditTgL,'General')
            Check_inputs(handles.EditTgK,'General')
            Check_inputs(handles.EdirTgNa,'General')];
        
    end
end
valid=sum(valid_input);


