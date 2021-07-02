%CHECK INPUTS IN NUERAL (DE)SYNCHRONIZATION PART TO DETECT POSSIBLE ERRORS
% NPDSToolbox version 1.0.0
% 	Check_inputs_NPD(handles)
%		The function "Check_inputs_NPD" consists of three sub-functions,
%		"is_number", "U_min_max" and "is_positive".
%	    Each of these sub-functions is used to specify the type of error that occurred.
% 		The variable "validation" gets the number of errors that occurred,
%	    and the output corresponding to the error occurred is displayed by the function "show_error".
% -----ERROR CHECKING TYPES-----
%	   1- show_error(1)    Display error related to empty edit box
%	   2- show_error(2)    Display error related to invalid edit box value (character)
%	   3- show_error(4)    Display error related to invalid edit box value (lower bound >= upper bound)
%	   4- show_error(6)    Display error related to invalid edit box value (final time)
%      5- show_error(7)    Display error related to invalid edit box value (positive input)
%		...(see show_error(..))
%-----------------------

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)


function validation=Check_inputs_NPD(handles)
validation=0;
%Control type
if get(handles.radiobutton_control_proportional,'Value')>0
    validation=validation+is_number(handles.Edit_K)+is_number(handles.Edit_Umin)+is_number(handles.Edit_Umax)+...
        U_min_max(handles.Edit_Umin,handles.Edit_Umax)+is_positive(handles.Edit_K);
elseif get(handles.radiobutton_control_BangBang,'Value')>0
    validation=validation+is_number(handles.Edit_Umin)+is_number(handles.Edit_Umax)+...
        U_min_max(handles.Edit_Umin,handles.Edit_Umax);
end
%neuron property
if get(handles.checkbox_Noise,'Value')>0
    validation=validation+is_number(handles.Edit_Intensity)+is_positive(handles.Edit_Intensity);
end
validation=validation+is_number(handles.Edit_Oscillator_Period)+is_positive(handles.Edit_Oscillator_Period);
%Distribution
contents = get(handles.popupm_Init_Dist,'String');
val = contents{get(handles.popupm_Init_Dist,'Value')};
if strcmp(val,'Von-Mises')
    validation=validation+is_number(handles.Edit_Mean_Initial_Dist)+is_positive(handles.Edit_Mean_Initial_Dist)+...
        validation+is_number(handles.Edit_Varience_Initial_Dist)+is_positive(handles.Edit_Varience_Initial_Dist);
end
contents = get(handles.popup_Final_Dist,'String');
val = contents{get(handles.popup_Final_Dist,'Value')};
if strcmp(val,'Von-Mises')
    validation=validation+is_number(handles.Edit_Mean_Final_Dist)+is_positive(handles.Edit_Mean_Final_Dist)+...
        validation+is_number(handles.Edit_Varience_Fianl_Dist)+is_positive(handles.Edit_Varience_Fianl_Dist);
end
%Population
validation=validation+is_number(handles.Edit_Pop)+is_positive(handles.Edit_Pop);
%Time
validation=validation+is_number(handles.Edit_FinalT)+is_positive(handles.Edit_FinalT);



function validation=is_number(hObject)
validation=0;
set(hObject,'Backgroundcolor','w');
if isempty(get(hObject,'String'))
    set(hObject,'Backgroundcolor','r');
    validation=1;
    show_error(1);
elseif isempty( str2num( get(hObject,'String') ) )
    set(hObject,'Backgroundcolor','r');
    validation=1;
    show_error(2);
end

function validation=U_min_max(hObject_min,hObject_max)
validation=0;
set(hObject_min,'Backgroundcolor','w');
set(hObject_max,'Backgroundcolor','w');
if str2double( get(hObject_min,'String'))>=str2double( get(hObject_max,'String'))
    set(hObject_min,'Backgroundcolor','r');
    set(hObject_max,'Backgroundcolor','r');
    validation=1;
    show_error(4);
end
function validation=is_positive(hObject)
validation=0;
if str2double(get(hObject,'String'))<0
    set(hObject,'Backgroundcolor','r');
    validation=1;
    if strcmp(get(hObject,'Tag'),'Edit_FinalT')
        show_error(6);
    else
        show_error(7);
    end
end