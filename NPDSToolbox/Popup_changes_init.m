%%% SELECTION OF DYNAMIC MODELS
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)


% By selecting a model in the pop-up window,
% this code modifies sliders, edit boxes, and
% checkboxes to execute the selected model.

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)


function Popup_changes_init(handles)
H_visible=get(handles.Phasetoggle,'state');
contents = get(handles.Popup_Neuron,'String');
val = contents{get(handles.Popup_Neuron,'Value')};
if strcmp(val,'Hudgkin-Huxley')
    set(handles.Panel_HH,'visible','on');
    set(handles.Panel_FHN,'visible','off');
    set(handles.Panel_RH,'visible','off');
    set(handles.Panel_Thalamic,'visible','off');
    set(handles.TextInitcond1,'String','Initial condotion (v)','visible','on');
    set(handles.TextInitcond2,'String','Initial condotion (m)','visible','on');
    set(handles.TextInitcond3,'String','Initial condotion (h)','visible','on');
    set(handles.TextInitcond4,'String','Initial condotion (n)','visible','on');
    set(handles.Editnitcond1,'visible','on','String','0.01');
    set(handles.Editnitcond2,'visible','on','String','0.02');
    set(handles.Editnitcond3,'visible','on','String','0.03');
    set(handles.Editnitcond4,'visible','on','String','0.04');
    set(handles.Slider_exter_current,'visible','on','value',0.1,'min',0,'max',100);
    set(handles.Slider_initcond1,'visible','on','value',0.01,'min',-40,'max',100);
    set(handles.Slider_initcond2,'visible','on','value',0.02,'min',0,'max',1);
    set(handles.Slider_initcond3,'visible','on','value',0.03,'min',0,'max',1);
    set(handles.Slider_initcond4,'visible','on','value',0.04,'min',0,'max',1);
    set(handles.Check_plot1,'visible','on','string','v','value',1);
    set(handles.Check_plot2,'visible','on','string','m','value',0);
    set(handles.Check_plot3,'visible','on','string','h','value',0);
    set(handles.Check_plot4,'visible','on','string','n','value',0);
    set(handles.EditHHvNa,'String',120);
    set(handles.EditHHvK,'String',-12);
    set(handles.EditHHvL,'String',10.6);
    set(handles.EditHHgNa,'String',120);
    set(handles.EditHHgK,'String',36);
    set(handles.EditHHgL,'String',0.3);
    set(handles.EditHHC,'String',1);
    if  H_visible(2)=='n'
        set(handles.Check_port1,'visible','on','Enable','on','string','v','value',1);
        set(handles.Check_port2,'visible','on','Enable','on','string','m','value',1);
        set(handles.Check_port3,'visible','on','Enable','off','string','h','Enable','off','value',0);
        set(handles.Check_port4,'visible','on','Enable','off','string','n','Enable','off','value',0);
        set(handles.Check_3D,'visible','on','Enable','on','value',0);
    end
    set(handles.Check_scale,'visible','on','Enable','on','value',0);
    set(handles.Opt_text_I,'string',get(handles.Text_Exter_current,'string'),'visible','on');
    set(handles.L_current,'string',num2str(get(handles.Slider_exter_current,'min')),'visible','on');
    set(handles.U_current,'string',num2str(get(handles.Slider_exter_current,'max')),'visible','on');
    set(handles.IC1_text,'string',get(handles.TextInitcond1,'string'),'visible','on');
    set(handles.IC1_L_edit,'string',num2str(get(handles.Slider_initcond1,'min')),'visible','on');
    set(handles.IC1_U_edit,'string',num2str(get(handles.Slider_initcond1,'max')),'visible','on');
    set(handles.IC2_text,'string',get(handles.TextInitcond2,'string'),'visible','on');
    set(handles.IC2_L_edit,'string',num2str(get(handles.Slider_initcond2,'min')),'visible','on');
    set(handles.IC2_U_edit,'string',num2str(get(handles.Slider_initcond2,'max')),'visible','on');
    set(handles.IC3_text,'string',get(handles.TextInitcond3,'string'),'visible','on');
    set(handles.IC3_L_edit,'string',num2str(get(handles.Slider_initcond3,'min')),'visible','on');
    set(handles.IC3_U_edit,'string',num2str(get(handles.Slider_initcond3,'max')),'visible','on');
    set(handles.IC4_text,'string',get(handles.TextInitcond4,'string'),'visible','on');
    set(handles.IC4_L_edit,'string',num2str(get(handles.Slider_initcond4,'min')),'visible','on');
    set(handles.IC4_U_edit,'string',num2str(get(handles.Slider_initcond4,'max')),'visible','on');
    
elseif strcmp(val,'FihzHugh-Nagumo')
    set(handles.IC3_text,'visible','off');
    set(handles.IC3_L_edit,'visible','off');
    set(handles.IC3_U_edit,'visible','off');
    set(handles.IC4_text,'visible','off');
    set(handles.IC4_L_edit,'visible','off');
    set(handles.IC4_U_edit,'visible','off');
    set(handles.Panel_HH,'visible','off');
    set(handles.Panel_FHN,'visible','on');
    set(handles.Panel_RH,'visible','off');
    set(handles.Panel_Thalamic,'visible','off');
    set(handles.TextInitcond1,'String','Initial condotion (V)','visible','on');
    set(handles.TextInitcond2,'String','Initial condotion (W)','visible','on');
    set(handles.TextInitcond3,'String','Initial condotion ( )','visible','off');
    set(handles.TextInitcond4,'String','Initial condotion ( )','visible','off');
    set(handles.Editnitcond1,'visible','on','String','0.2');
    set(handles.Editnitcond2,'visible','on','String','0.5');
    set(handles.Editnitcond3,'visible','of','String','0.2');
    set(handles.Editnitcond4,'visible','off','String','0.5');
    set(handles.Slider_exter_current,'visible','on','value',0.8,'min',0,'max',5);
    set(handles.Slider_initcond1,'visible','on','value',0.2,'min',-2.5,'max',2.5);
    set(handles.Slider_initcond2,'visible','on','value',0.5,'min',-2.5,'max',2.5);
    set(handles.Slider_initcond3,'visible','off','string','w');
    set(handles.Slider_initcond4,'visible','off','string','h');
    set(handles.Check_plot1,'visible','on','string','v','value',1);
    set(handles.Check_plot2,'visible','on','string','w','value',0);
    set(handles.Check_plot3,'visible','off','string','h','value',0);
    set(handles.Check_plot4,'visible','off','string','n','value',0);
    set(handles.EditFHNa,'String',0.08);
    set(handles.EditFHNb,'String',0.7);
    set(handles.EditFHNc,'String',0.8);
    if  H_visible(2)=='n'
        set(handles.Check_port1,'visible','on','string','v','value',1,'Enable','inactive');
        set(handles.Check_port2,'visible','on','string','w','value',1,'Enable','inactive');
        set(handles.Check_port3,'visible','off','string','h','Enable','off','value',0);
        set(handles.Check_port4,'visible','off','string','n','Enable','off','value',0);
        set(handles.Check_3D,'visible','off','Enable','off','value',0);
    end
    set(handles.Check_scale,'visible','on','Enable','on','value',0);
    set(handles.Opt_text_I,'string',get(handles.Text_Exter_current,'string'),'visible','on');
    set(handles.L_current,'string',num2str(get(handles.Slider_exter_current,'min')),'visible','on');
    set(handles.U_current,'string',num2str(get(handles.Slider_exter_current,'max')),'visible','on');
    set(handles.IC1_text,'string',get(handles.TextInitcond1,'string'),'visible','on');
    set(handles.IC1_L_edit,'string',num2str(get(handles.Slider_initcond1,'min')),'visible','on');
    set(handles.IC1_U_edit,'string',num2str(get(handles.Slider_initcond1,'max')),'visible','on');
    set(handles.IC2_text,'string',get(handles.TextInitcond2,'string'),'visible','on');
    set(handles.IC2_L_edit,'string',num2str(get(handles.Slider_initcond2,'min')),'visible','on');
    set(handles.IC2_U_edit,'string',num2str(get(handles.Slider_initcond2,'max')),'visible','on');
elseif strcmp(val,'Rose-Hindmarsh')
    set(handles.IC4_text,'visible','off');
    set(handles.IC4_L_edit,'visible','off');
    set(handles.IC4_U_edit,'visible','off');
    set(handles.Panel_HH,'visible','off');
    set(handles.Panel_FHN,'visible','off');
    set(handles.Panel_RH,'visible','on');
    set(handles.Panel_Thalamic,'visible','off');
    set(handles.TextInitcond1,'String','Initial condotion (x)','visible','on');
    set(handles.TextInitcond2,'String','Initial condotion (y)','visible','on');
    set(handles.TextInitcond3,'String','Initial condotion (z)','visible','on');
    set(handles.TextInitcond4,'String','Initial condotion ( )','visible','off');
    set(handles.Editnitcond1,'visible','on','String','0.5');
    set(handles.Editnitcond2,'visible','on','String','0.5');
    set(handles.Editnitcond3,'visible','on','String','0.5');
    set(handles.Editnitcond4,'visible','off','String','0.1');
    set(handles.Edit_exter_current,'visible','on','String','0.0');
    set(handles.Slider_exter_current,'visible','on','value',0,'min',-2,'max',2);
    set(handles.Slider_initcond1,'visible','on','value',0.5,'min',-2.5,'max',2);
    set(handles.Slider_initcond2,'visible','on','value',0.5,'min',-10,'max',3);
    set(handles.Slider_initcond3,'visible','on','value',0.5,'min',0,'max',5);
    set(handles.Slider_initcond4,'visible','off','value',0.1);
    set(handles.Check_plot1,'visible','on','string','x','value',1);
    set(handles.Check_plot2,'visible','on','string','y','value',0);
    set(handles.Check_plot3,'visible','on','string','z','value',0);
    set(handles.Check_plot4,'visible','off','Enable','on','string','n','value',0);
    set(handles.EditRHa,'String',0.7);
    set(handles.EditRHb,'String',3);
    set(handles.EditRHc,'String',1);
    set(handles.EditRHd,'String',5);
    set(handles.EditRHr,'String',0.005);
    set(handles.EditRHs,'String',4);
    set(handles.EditRHXr,'String',-1.6);
    if  H_visible(2)=='n'
        set(handles.Check_port1,'visible','on','Enable','on','string','x','value',1);
        set(handles.Check_port2,'visible','on','Enable','on','string','y','value',1);
        set(handles.Check_port3,'visible','on','Enable','off','string','z','Enable','off','value',0);
        set(handles.Check_port4,'visible','off','string','n','Enable','off','value',0);
        set(handles.Check_3D,'visible','on','Enable','on','value',0);
    end
    set(handles.Check_scale,'visible','on','Enable','on','value',0);
    set(handles.Slider_initcond1,'min',0);
    set(handles.Slider_initcond1,'max',1);
    set(handles.Slider_initcond2,'min',0);
    set(handles.Slider_initcond2,'max',1);
    set(handles.Slider_initcond3,'min',0);
    set(handles.Slider_initcond3,'max',1);
    set(handles.Slider_exter_current,'min',0);
    set(handles.Slider_exter_current,'max',10);
    set(handles.Opt_text_I,'string',get(handles.Text_Exter_current,'string'),'visible','on');
    set(handles.L_current,'string',num2str(get(handles.Slider_exter_current,'min')),'visible','on');
    set(handles.U_current,'string',num2str(get(handles.Slider_exter_current,'max')),'visible','on');
    set(handles.IC1_text,'string',get(handles.TextInitcond1,'string'),'visible','on');
    set(handles.IC1_L_edit,'string',num2str(get(handles.Slider_initcond1,'min')),'visible','on');
    set(handles.IC1_U_edit,'string',num2str(get(handles.Slider_initcond1,'max')),'visible','on');
    set(handles.IC2_text,'string',get(handles.TextInitcond2,'string'),'visible','on');
    set(handles.IC2_L_edit,'string',num2str(get(handles.Slider_initcond2,'min')),'visible','on');
    set(handles.IC2_U_edit,'string',num2str(get(handles.Slider_initcond2,'max')),'visible','on');
    set(handles.IC3_text,'string',get(handles.TextInitcond3,'string'),'visible','on');
    set(handles.IC3_L_edit,'string',num2str(get(handles.Slider_initcond3,'min')),'visible','on');
    set(handles.IC3_U_edit,'string',num2str(get(handles.Slider_initcond3,'max')),'visible','on');
elseif strcmp(val,'Thalamic')
    set(handles.Panel_HH,'visible','off');
    set(handles.Panel_FHN,'visible','off');
    set(handles.Panel_RH,'visible','off');
    set(handles.Panel_Thalamic,'visible','on');
    set(handles.TextInitcond1,'String','Initial condotion (v)','visible','on');
    set(handles.TextInitcond2,'String','Initial condotion (h)','visible','on');
    set(handles.TextInitcond3,'String','Initial condotion (r)','visible','on');
    set(handles.TextInitcond4,'String','Initial condotion ( )','visible','off');
    set(handles.Editnitcond1,'visible','on','String','-57');
    set(handles.Editnitcond2,'visible','on','String','0.1');
    set(handles.Editnitcond3,'visible','on','String','0.002');
    set(handles.Editnitcond4,'visible','off','String','0.1');
    set(handles.Edit_exter_current,'visible','on','String','0.5');
    set(handles.Slider_exter_current,'visible','on','value',0.5,'min',0,'max',15);
    set(handles.Slider_initcond1,'visible','on','value',-57,'min',-70,'max',10);
    set(handles.Slider_initcond2,'visible','on','value',0.1,'min',0,'max',1);
    set(handles.Slider_initcond3,'visible','on','value',0.002,'min',-0.2,'max',0.2);
    set(handles.Slider_initcond4,'visible','off','value',0.1);
    set(handles.Check_plot1,'visible','on','string','v','value',1);
    set(handles.Check_plot2,'visible','on','string','h','value',0);
    set(handles.Check_plot3,'visible','on','string','r','value',0);
    set(handles.Check_plot4,'visible','off','string','n','value',0);
    set(handles.EditTeT,'String',0);
    set(handles.EditTeL,'String',-70);
    set(handles.EditTeK,'String',-90);
    set(handles.EditTeNa,'String',50);
    set(handles.EditTeC,'String',1);
    set(handles.EditTgT,'String',5);
    set(handles.EditTgL,'String',0.05);
    set(handles.EditTgK,'String',5);
    set(handles.EdirTgNa,'String',3);
    
    if  H_visible(2)=='n'
        set(handles.Check_port1,'visible','on','Enable','on','string','v','value',1);
        set(handles.Check_port2,'visible','on','Enable','on','string','h','value',1);
        set(handles.Check_port3,'visible','on','Enable','off','string','r','Enable','off','value',0);
        set(handles.Check_port4,'visible','off','Enable','off','string','n','Enable','off','value',0);
        set(handles.Check_3D,'visible','on','Enable','on','value',0);
    end
    set(handles.Check_scale,'visible','on','Enable','on','value',0);
    set(handles.Opt_text_I,'string',get(handles.Text_Exter_current,'string'),'visible','on');
    set(handles.L_current,'string',num2str(get(handles.Slider_exter_current,'min')),'visible','on');
    set(handles.U_current,'string',num2str(get(handles.Slider_exter_current,'max')),'visible','on');
    set(handles.IC1_text,'string',get(handles.TextInitcond1,'string'),'visible','on');
    set(handles.IC1_L_edit,'string',num2str(get(handles.Slider_initcond1,'min')),'visible','on');
    set(handles.IC1_U_edit,'string',num2str(get(handles.Slider_initcond1,'max')),'visible','on');
    set(handles.IC2_text,'string',get(handles.TextInitcond2,'string'),'visible','on');
    set(handles.IC2_L_edit,'string',num2str(get(handles.Slider_initcond2,'min')),'visible','on');
    set(handles.IC2_U_edit,'string',num2str(get(handles.Slider_initcond2,'max')),'visible','on');
    set(handles.IC3_text,'string',get(handles.TextInitcond3,'string'),'visible','on');
    set(handles.IC3_L_edit,'string',num2str(get(handles.Slider_initcond3,'min')),'visible','on');
    set(handles.IC3_U_edit,'string',num2str(get(handles.Slider_initcond3,'max')),'visible','on');
    set(handles.IC4_text,'string',get(handles.TextInitcond4,'string'),'visible','on');
    set(handles.IC4_L_edit,'string',num2str(get(handles.Slider_initcond4,'min')),'visible','on');
    set(handles.IC4_U_edit,'string',num2str(get(handles.Slider_initcond4,'max')),'visible','on');
end
