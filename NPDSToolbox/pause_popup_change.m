% (EN/DIS)ABLES OBJECTS AFTER CLICKING PAUSE BUTTON
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)

%       This code (en/dis)ables objects by
%       clicking on pause button to prevent errors.

function pause_popup_change(handles)
val=get(handles.Pause_button,'String');
if strcmp(val,'Pause')
    set(handles.Pause_button,'String','Resume');
    set(handles.Start_button,'Enable','off');
    set(handles.Zoom_In,'Enable','on');
    set(handles.Zoom_out,'Enable','on');
    set(handles.Pan3,'Enable','on');
    set(handles.DataCrusor4,'Enable','on');
    set(handles.Legend1,'Enable','on');
    set(handles.grid1,'Enable','on');
    set(handles.grid2,'Enable','on');
else
    set(handles.Pause_button,'String','Pause');
    set(handles.Start_button,'Enable','on');
    set(handles.Zoom_In,'Enable','off','state','off');
    set(handles.Zoom_out,'Enable','off','state','off');
    set(handles.Pan3,'Enable','off','state','off');
    set(handles.DataCrusor4,'Enable','off','state','off');
    set(handles.Legend1,'Enable','off');
    set(handles.grid1,'Enable','off','state','off');
    set(handles.grid2,'Enable','off','state','off');
end
set(handles.Pause_button,'userdata',get(handles.Pause_button,'value'));
