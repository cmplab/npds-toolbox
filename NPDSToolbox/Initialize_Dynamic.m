%%%   INITIALIZES THE PARAMETERS OF 'HUDGKIN-HUXLEY' MODEL
% NPDSToolbox version 1.0.0
% By running the program, the values of the the Hodgkin-Huxley model parameters
% are set for initialization in the program.

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function Initialize_Dynamic(handles,varargin)
H_visible=get(handles.Phasetoggle,'state');
set(handles.Edit_exter_current,'String',get(handles.Slider_exter_current,'value'));
set(handles.Panel_HH,'visible','on');
set(handles.Panel_FHN,'visible','off');
set(handles.Panel_RH,'visible','off');
set(handles.Panel_Thalamic,'visible','off');
set(handles.Check_plot1,'visible','on','string','v','value',1);
set(handles.Check_plot2,'visible','on','string','m');
set(handles.Check_plot3,'visible','on','string','h');
set(handles.Check_plot4,'visible','on','string','n');
if  H_visible(2)=='n'
    set(handles.Check_port1,'visible','on','string','v','value',1);
    set(handles.Check_port2,'visible','on','string','m','value',1);
    set(handles.Check_port3,'visible','on','string','h','Enable','off');
    set(handles.Check_port4,'visible','on','string','n','Enable','off');
    set(handles.Check_3D,'visible','on','string','3D','Enable','on');
end
set(handles.Opt_text_I,'string',get(handles.Text_Exter_current,'string'));
set(handles.L_current,'string',num2str(get(handles.Slider_exter_current,'min')));
set(handles.U_current,'string',num2str(get(handles.Slider_exter_current,'max')));
set(handles.IC1_text,'string',get(handles.TextInitcond1,'string'));
set(handles.IC1_L_edit,'string',num2str(get(handles.Slider_initcond1,'min')));
set(handles.IC1_U_edit,'string',num2str(get(handles.Slider_initcond1,'max')));
set(handles.IC2_text,'string',get(handles.TextInitcond2,'string'));
set(handles.IC2_L_edit,'string',num2str(get(handles.Slider_initcond2,'min')));
set(handles.IC2_U_edit,'string',num2str(get(handles.Slider_initcond2,'max')));
set(handles.IC3_text,'string',get(handles.TextInitcond3,'string'));
set(handles.IC3_L_edit,'string',num2str(get(handles.Slider_initcond3,'min')));
set(handles.IC3_U_edit,'string',num2str(get(handles.Slider_initcond3,'max')));
set(handles.IC4_text,'string',get(handles.TextInitcond4,'string'));
set(handles.IC4_L_edit,'string',num2str(get(handles.Slider_initcond4,'min')));
set(handles.IC4_U_edit,'string',num2str(get(handles.Slider_initcond4,'max')));
set(handles.Time_edit,'string','50');
set(handles.grid1,'State','off');
set(handles.grid2,'State','off');
