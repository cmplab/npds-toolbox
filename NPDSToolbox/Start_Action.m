%%%  MODIFYS, ENABLES OR DISABLES THE OBJECTS (EDITBOX, CHECKBOX AND ...) DURING THE (START/PAUSE/STOP) OF THE ALGORITHM
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)

% This code modifies some objects when clicking the start, pause or stop button (For error handling)

function Start_Action(handles)
set(handles.Pause_button,'Enable','on');
val=get(handles.Start_button,'String');
if strcmp(val,'Start')
    set(handles.Start_static,'visible','off');
    set(handles.Start_button,'String','Stop');
    set(handles.Edit_Pop,'Enable','off');
    set(handles.Edit_FinalT,'Enable','off');
    set(handles.Popup_Method,'Enable','inactive');
    set(handles.Edit_Mean_Initial_Dist,'Enable','off');
    set(handles.Edit_Varience_Initial_Dist,'Enable','off');
    set(handles.Edit_Mean_Final_Dist,'Enable','off');
    set(handles.Edit_Varience_Fianl_Dist,'Enable','off');
    set(handles.popupm_Init_Dist,'Enable','inactive');
    set(handles.popup_Final_Dist,'Enable','inactive');
    set(handles.checkbox_Noise,'Enable','off');
    set(handles.Edit_Intensity,'Enable','off');
    set(handles.Edit_Oscillator_Period,'Enable','off');
    set(handles.Popup_PRC,'Enable','inactive');
    set(handles.radiobutton_control_proportional,'Enable','inactive');
    set(handles.radiobutton_control_BangBang,'Enable','inactive');
    set(handles.radiobutton_control_Specified,'Enable','inactive');
    set(handles.Edit_K,'Enable','off');
    set(handles.Edit_Umax,'Enable','off');
    set(handles.Edit_Umin,'Enable','off');
    set(handles.Zoom_In,'Enable','off','state','off');
    set(handles.Zoom_out,'Enable','off','state','off');
    set(handles.Pan3,'Enable','off','state','off');
    set(handles.DataCrusor4,'Enable','off','state','off');
    set(handles.Legend1,'Enable','off');
    set(handles.grid1,'Enable','off','state','off');
    set(handles.grid2,'Enable','off','state','off');
    set(handles.SaveFigs,'Enable','off');
    set(handles.SaveMat,'Enable','off');
else
    set(handles.Start_button,'String','Start');
    set(handles.Pause_button,'Enable','off');
    set(handles.Edit_Pop,'Enable','on');
    set(handles.Edit_FinalT,'Enable','on');
    set(handles.Popup_Method,'Enable','on');
    set(handles.popupm_Init_Dist,'Enable','on');
    set(handles.popup_Final_Dist,'Enable','on');
    %     if get(handles.radiobutton_Init_Gaussian,'value')
    set(handles.Edit_Mean_Initial_Dist,'Enable','on');
    set(handles.popup_Final_Dist,'Enable','on');
    set(handles.Edit_Mean_Final_Dist,'Enable','on');
    set(handles.Edit_Varience_Fianl_Dist,'Enable','on');
    set(handles.Edit_Varience_Initial_Dist,'Enable','on');
    set(handles.Zoom_In,'Enable','on');
    set(handles.Zoom_out,'Enable','on');
    set(handles.Pan3,'Enable','on');
    set(handles.DataCrusor4,'Enable','on');
    set(handles.Legend1,'Enable','on');
    set(handles.grid1,'Enable','on');
    set(handles.grid2,'Enable','on');
    set(handles.SaveFigs,'Enable','on');
    set(handles.SaveMat,'Enable','on');
    %     end
    %     set(handles.radiobutton_Init_Gaussian,'Enable','on');
    %     set(handles.radiobutton_Init_Specified,'Enable','on');
    set(handles.checkbox_Noise,'Enable','on');
    set(handles.Edit_Oscillator_Period,'Enable','on');
    if get(handles.checkbox_Noise,'value')
        set(handles.Edit_Intensity,'Enable','on');
    end
    set(handles.Popup_PRC,'Enable','on');
    set(handles.radiobutton_control_proportional,'Enable','on');
    set(handles.radiobutton_control_BangBang,'Enable','on');
    set(handles.radiobutton_control_Specified,'Enable','on');
    if get(handles.radiobutton_control_proportional,'value')
        set(handles.Edit_K,'Enable','on');
        set(handles.Edit_Umax,'Enable','on');
        set(handles.Edit_Umin,'Enable','on');
    end
    if get(handles.radiobutton_control_BangBang,'value')
        set(handles.Edit_Umax,'Enable','on');
        set(handles.Edit_Umin,'Enable','on');
    end
    
end