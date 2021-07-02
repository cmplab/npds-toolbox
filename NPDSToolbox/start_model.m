%%START BUTTON ACTION
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)

%In this code, the inputs are checked and if there is no error,
%the function Run_test(..) is called to execute the simulation.

function start_model(handles)
set(handles.Start_button,'userdata',get(handles.Start_button,'value'));
validation=Check_inputs_NPD(handles);
if validation<=0
    if get(handles.Start_button,'value')==1
        Start_Action(handles)
%         report_main(handles);
        Run_test(handles,1);
        set(handles.Start_button,'userdata',get(handles.Start_button,'value'));
        set(handles.Start_button,'value',0);
        Start_Action(handles);
    else
        set(handles.Start_button,'userdata',get(handles.Start_button,'value'));
    end
end
