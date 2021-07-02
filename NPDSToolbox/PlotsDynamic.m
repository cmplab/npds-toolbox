%%% DRAWS DYNAMIC OF MODELS
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)

%   This code sends model parameters to the RKb function (see RKb(..))
%   according to the selected model and displays the received outputs in Dynamic axes.

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function [STEPS,result]=PlotsDynamic(handles)
contents = get(handles.Popup_Neuron,'String');
val = contents{get(handles.Popup_Neuron,'Value')};
if strcmp(val,'Hudgkin-Huxley')
    [result,STEPS]=RKb(get(handles.Slider_initcond1,'value'),get(handles.Slider_initcond2,'value'),...
        get(handles.Slider_initcond3,'value'),get(handles.Slider_initcond4,'value'),...
        get(handles.Slider_exter_current,'value'),str2double(get(handles.EditHHvNa,'String')),...
        str2double(get(handles.EditHHvK,'String')),str2double(get(handles.EditHHvL,'String')),...
        str2double(get(handles.EditHHgNa,'String')),str2double(get(handles.EditHHgK,'String')),...
        str2double(get(handles.EditHHgL,'String')),str2double(get(handles.EditHHC,'String')),str2double(get(handles.Time_edit,'string')));
elseif strcmp(val,'FihzHugh-Nagumo')
    [result,STEPS]=RKb(get(handles.Slider_initcond1,'value'),get(handles.Slider_initcond2,'value'),...
        get(handles.Slider_exter_current,'value'),str2double(get(handles.EditFHNa,'String')),...
        str2double(get(handles.EditFHNb,'String')),str2double(get(handles.EditFHNc,'String')),str2double(get(handles.Time_edit,'string')));
elseif strcmp(val,'Rose-Hindmarsh')
    [result,STEPS]=RKb(get(handles.Slider_initcond1,'value'),get(handles.Slider_initcond2,'value'),...
        get(handles.Slider_initcond3,'value'),get(handles.Slider_exter_current,'value'),str2double(get(handles.EditRHa,'String')),...
        str2double(get(handles.EditRHb,'String')),str2double(get(handles.EditRHc,'String')),...
        str2double(get(handles.EditRHd,'String')),str2double(get(handles.EditRHr,'String')),str2double(get(handles.EditRHs,'String')),str2double(get(handles.EditRHXr,'String')),str2double(get(handles.Time_edit,'string')));
elseif strcmp(val,'Thalamic')
    [result,STEPS]=RKb(get(handles.Slider_initcond1,'value'),get(handles.Slider_initcond2,'value'),...
        get(handles.Slider_initcond3,'value'),get(handles.Slider_exter_current,'value'),str2double(get(handles.EditTeNa,'String')),...
        str2double(get(handles.EditTeK,'String')),str2double(get(handles.EditTeL,'String')),...
        str2double(get(handles.EditTeT,'String')),str2double(get(handles.EdirTgNa,'String')),...
        str2double(get(handles.EditTgK,'String')),str2double(get(handles.EditTgL,'String')),str2double(get(handles.EditTgT,'String')),str2double(get(handles.EditTeC,'String')),str2double(get(handles.Time_edit,'string')));
end
data=show_option(STEPS,handles);
plot(handles.Axes_Dynamic,result,data,'LineWidth',2);
xlabel(handles.Axes_Dynamic,'Time');
ylabel(handles.Axes_Dynamic,'Result');
legend(handles.Axes_Dynamic,get_legend(handles,val));

%   In this code, the output of the  function RKb(..) (STEPS) is
%   modified according to the selected checkboxes for display in
%   dynamic axes. (see RKb(..))


function res=show_option(STEPS,handles)

cnt=1;
sz=size(STEPS);
res=zeros(sz(1),1);
if get(handles.Check_plot1,'value')
    res(:,cnt)=STEPS(:,1);
    cnt=cnt+1;
end
if get(handles.Check_plot2,'value')
    res(:,cnt)=STEPS(:,2);
    cnt=cnt+1;
end
if get(handles.Check_plot3,'value') && sz(2)>2
    res(:,cnt)=STEPS(:,3);
    cnt=cnt+1;
end
if get(handles.Check_plot4,'value') && sz(2)>2
    res(:,cnt)=STEPS(:,4);
end
if get(handles.Check_scale,'value')
    Min=abs(min(res));
    MinMul=ones(size(res))*diag(Min);
    res=res+MinMul;
    Max=max(res);
    MaxMul=ones(size(res))*diag(Max);
    res=res./MaxMul;
end

%   This code specifies valid labels for display in dynamic axes
%   The alpha variable can take four 'Hudgkin-Huxley',
%   'FihzHugh-Nagumo', 'Rose-Hindmarsh', 'Thalamic'  states


function res=get_legend(handles,type)
if strcmp(type,'Hudgkin-Huxley')
    Find_check=find([get(handles.Check_plot1,'value'),get(handles.Check_plot2,'value'),...
        get(handles.Check_plot3,'value'),get(handles.Check_plot4,'value')]);
    label={'v','m','h','n'};
    res=label(Find_check);
elseif strcmp(type,'FihzHugh-Nagumo')
    Find_check=find([get(handles.Check_plot1,'value'),get(handles.Check_plot2,'value')]);
    label={'V','W'};
    res=label(Find_check);
elseif strcmp(type,'Rose-Hindmarsh')
    Find_check=find([get(handles.Check_plot1,'value'),get(handles.Check_plot2,'value'),...
        get(handles.Check_plot3,'value')]);
    label={'x','y','z'};
    res=label(Find_check);
elseif strcmp(type,'Thalamic')
    Find_check=find([get(handles.Check_plot1,'value'),get(handles.Check_plot2,'value'),...
        get(handles.Check_plot3,'value')]);
    label={'v','h','r'};
    res=label(Find_check);
end