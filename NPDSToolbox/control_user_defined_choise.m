%%% OPENING THE USER-DEFINED CONTROL FILE TO APPLY THE DESIRED CONTROL
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)

%%% The function control_user_defined_choise(..) checks if an old user-defined control file exists or not,
%%% and if it exists, it displays a message asking the user to  use the old
%%% control or define a new one.


function control_user_defined_choise(handles)
set(handles.Edit_K, 'Enable', 'off');
set(handles.Edit_Umax, 'Enable', 'off');
set(handles.Edit_Umin, 'Enable', 'off');
filename='user_defined_control.m';
if exist(filename,'file')
    answer = questdlg('The old version of control is now available. Do you want to try a new control?','Warning',...
        'Yes','No','Yes');
    if strcmp(answer,'Yes')
        delete user_defined_control.m
        copyfile user_defined_control_static.m user_defined_control.m
        edit('user_defined_control.m');
    else
        edit('user_defined_control.m');
    end
else
    copyfile user_defined_control_static.m user_defined_control.m
    edit('user_defined_control.m');
end