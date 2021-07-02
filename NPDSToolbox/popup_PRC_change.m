%%% SELECTION OF PHASE RESPONCE CURVE
% NPDSToolbox version 1.0.0
% H			 Specified handle
% handles    Structure with handles and user data (see GUIDATA)


% By selecting a PRC in the pop-up window,
% this code modifies  edit boxes, and
% checkboxes to execute the selected PRC.


function popup_PRC_change(H,handles)
contents = get(H,'String');
val = contents{get(H,'Value')};
if strcmp(val,'Hudgkin-Huxley')
    set(handles.Edit_Oscillator_Period,'string','14.638');
elseif strcmp(val,'FitzHugh-Nagumo')
    set(handles.Edit_Oscillator_Period,'string','0.9');
elseif strcmp(val,'Rose-Hindmarsh')
    set(handles.Edit_Oscillator_Period,'string','0.2');
else
    set(handles.Edit_Oscillator_Period,'string','1');
end
