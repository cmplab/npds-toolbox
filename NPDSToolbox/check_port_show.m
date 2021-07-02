%MAKES VISIBLE OR INVISIBLE CHECKBOXES
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% flag       States to disable phase checkboxes (visible/invisible)

%-----FLAG TYPES-----
%       1- flag = 1 Makes valid checkboxes visible for dynamic models
%       2- flag = 0 Makes valid checkboxes invisible for dynamic models
%       3- flag = 2 Reserved mode for future version
%       4- flag = 3 Reserved mode for future version
%---------------------

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function check_port_show(handles,flag)
contents = get(handles.Popup_Neuron,'String');
val = contents{get(handles.Popup_Neuron,'Value')};
if flag==1
    set(handles.Check_port1,'visible','on');
    set(handles.Check_port2,'visible','on');
    if strcmp(val,'Hudgkin-Huxley')
        set(handles.Check_port3,'visible','on');
        set(handles.Check_port4,'visible','on');
        set(handles.Check_3D,'visible','on','Enable','on');
    elseif strcmp(val,'Rose-Hindmarsh')
        set(handles.Check_port3,'visible','on');
        set(handles.Check_3D,'visible','on','Enable','on');
    elseif strcmp(val,'Thalamic')
        set(handles.Check_port3,'visible','on');
        set(handles.Check_3D,'visible','on','Enable','on');
    end
elseif flag==0
    set(handles.Check_port1,'visible','off');
    set(handles.Check_port2,'visible','off');
    set(handles.Check_port3,'visible','off');
    set(handles.Check_port4,'visible','off');
    set(handles.Check_3D,'visible','off');
elseif flag==2
    
    set(handles.Check_port1,'Enable','on');
    set(handles.Check_port2,'Enable','on');
    set(handles.Check_plot1,'visible','on');
    set(handles.Check_plot2,'visible','on');
    set(handles.Check_scale,'visible','on','Enable','on');
    if strcmp(val,'Hudgkin-Huxley')
        set(handles.Check_plot3,'visible','on');
        set(handles.Check_plot4,'visible','on');
        set(handles.Check_port3,'Enable','on');
        set(handles.Check_3D,'Enable','on');
        set(handles.Check_port4,'Enable','on');
    elseif strcmp(val,'Rose-Hindmarsh')
        set(handles.Check_port3,'Enable','on');
        set(handles.Check_3D,'Enable','on');
        set(handles.Check_plot3,'visible','on');
    elseif strcmp(val,'Thalamic')
        set(handles.Check_plot3,'visible','on');
        set(handles.Check_port3,'Enable','on');
        set(handles.Check_3D,'Enable','on');
    end
elseif flag==3
    set(handles.Check_port1,'Enable','off');
    set(handles.Check_port2,'Enable','off');
    set(handles.Check_port3,'Enable','off');
    set(handles.Check_port4,'Enable','off');
    set(handles.Check_3D,'Enable','off');
    set(handles.Check_plot1,'visible','off');
    set(handles.Check_plot2,'visible','off');
    set(handles.Check_plot3,'visible','off');
    set(handles.Check_plot4,'visible','off');
    set(handles.Check_scale,'visible','off');
end

end