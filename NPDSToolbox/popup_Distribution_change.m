% SELECTION OF DISTRIBUTION
% NPDSToolbox version 1.0.0
% H			 Specified handle
% handles    Structure with handles and user data (see GUIDATA)
% type	     type of distribution


% By selecting a distribution in the pop-up window,
% this code modifies  edit boxes, and
% checkboxes to execute the selected distibution.


function popup_Distribution_change(H,handles,type)
contents = get(H,'String');
val = contents{get(H,'Value')};
if strcmp(type,'Initial')
    if strcmp(val,'Von-Mises')
        set(handles.Text_mean_init,'visible','on');
        set(handles.Edit_Mean_Initial_Dist,'visible','on');
        set(handles.Text_varience_init,'visible','on');
        set(handles.Edit_Varience_Initial_Dist,'visible','on');
    elseif strcmp(val,'Uniform')
        set(handles.Text_mean_init,'visible','off');
        set(handles.Edit_Mean_Initial_Dist,'visible','off');
        set(handles.Text_varience_init,'visible','off');
        set(handles.Edit_Varience_Initial_Dist,'visible','off');
    else
        set(handles.Text_mean_init,'visible','off');
        set(handles.Edit_Mean_Initial_Dist,'visible','off');
        set(handles.Text_varience_init,'visible','off');
        set(handles.Edit_Varience_Initial_Dist,'visible','off');
        filename='user_defined_initial_dist.m';
        if exist(filename,'file')
            answer = questdlg('The old version of initial population is now available. Do you want to try a new control?','Warning',...
                'Yes','No','Yes');
            if strcmp(answer,'Yes')
                delete user_defined_initial_dist.m
                copyfile user_defined_initial_dist_static.m user_defined_initial_dist.m
                edit('user_defined_initial_dist.m');
            else
                edit('user_defined_initial_dist.m');
            end
        else
            copyfile user_defined_initial_dist_static.m user_defined_initial_dist.m
            edit('user_defined_initial_dist.m');
        end
    end
else
    if strcmp(val,'Von-Mises')
        set(handles.Text_mean_final,'visible','on');
        set(handles.Edit_Mean_Final_Dist,'visible','on');
        set(handles.Text_varience_final,'visible','on');
        set(handles.Edit_Varience_Fianl_Dist,'visible','on');
    elseif strcmp(val,'Uniform')
        set(handles.Text_mean_final,'visible','off');
        set(handles.Edit_Mean_Final_Dist,'visible','off');
        set(handles.Text_varience_final,'visible','off');
        set(handles.Edit_Varience_Fianl_Dist,'visible','off');
    else
        set(handles.Text_mean_final,'visible','off');
        set(handles.Edit_Mean_Final_Dist,'visible','off');
        set(handles.Text_varience_final,'visible','off');
        set(handles.Edit_Varience_Fianl_Dist,'visible','off');
        filename='user_defined_final_dist.m';
        if exist(filename,'file')
            answer = questdlg('The old version of final population is now available. Do you want to try a new control?','Warning',...
                'Yes','No','Yes');
            if strcmp(answer,'Yes')
                delete user_defined_final_dist.m
                copyfile user_defined_final_dist_static.m user_defined_final_dist.m
                edit('user_defined_final_dist.m');
            else
                edit('user_defined_final_dist.m');
            end
        else
            copyfile user_defined_final_dist_static.m user_defined_final_dist.m
            edit('user_defined_final_dist.m');
        end
    end
end

