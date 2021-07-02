%CHECK AND ACTIVATE (DEACTIVATE) CHECKBOXES TO DRAW A PORTRAIT
% NPDSToolbox version 1.0.0
% handles    handle to Check boxes (see GCBO)

%-----Help: selecting checkboxes to draw 2D & 3D portraits-----
%		There are generally five checkboxes for drawing portrait.
%       Four checkboxes according to the dimensions of dynamic models
%       One checkboxes according to drawing 3D portrait
%       If pop-up refers to the 'Hudgkin-Huxley' model:
%			The checkboxes refer to the v, m, n and h dimensions,
%		    You can also select two active checkboxes to draw 2D portrait.
%			By clicking on the 3D checkbox, you can choose three checkboxes to draw a 3D portrait.
%       If pop-up refers to the 'Rose-Hindmarsh' model:
%			Three checkboxes refer to the x, y and z dimensions,
%			and the extra checkbox becomes inactive and invisible.
%		    You can also select two active checkboxes to draw 2D portrait.
%			By clicking on the 3D checkbox, you can choose three checkboxes
%			to draw a 3D portrait.
%       If pop-up refers to the 'Thalamic' model:
%			Three checkboxes refer to the v, h andr dimensions,
%			and the extra checkbox becomes inactive and invisible.
%		    You can also select two active checkboxes to draw 2D portrait.
%			By clicking on the 3D checkbox, you can choose three checkboxes
%			to draw a 3D portrait.
%       If pop-up refers to the 'FitzHugh-Nagumo' model:
%			Two checkboxes refer to the V and W dimensions,
%			and the extra checkbox (including 3D checkbox) becomes inactive and invisible
%---------------------------------------------------------------
%       runable variable returns two values 0 or 1 to the output,
%	    which 1 means "valid for drawing portrait" and 0 means "invalid for drawing portrait".

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function runable=check_port_eval(handles)
runable=false;
if get(handles.Check_3D,'value')
    legal_check=3;
else
    legal_check=2;
end
contents = get(handles.Popup_Neuron,'String');
val = contents{get(handles.Popup_Neuron,'Value')};
if strcmp(val,'Hudgkin-Huxley')
    Checks=[get(handles.Check_port1,'value'),get(handles.Check_port2,'value'),get(handles.Check_port3,'value'),get(handles.Check_port4,'value')];
    if sum(Checks)<legal_check
        set(handles.Check_port1,'Enable','on');
        set(handles.Check_port2,'Enable','on');
        set(handles.Check_port3,'Enable','on');
        set(handles.Check_port4,'Enable','on');
    else
        runable=true;
        if ~get(handles.Check_port1,'value')
            set(handles.Check_port1,'Enable','off');
        end
        if ~get(handles.Check_port2,'value')
            set(handles.Check_port2,'Enable','off');
        end
        if ~get(handles.Check_port3,'value')
            set(handles.Check_port3,'Enable','off');
        end
        if ~get(handles.Check_port4,'value')
            set(handles.Check_port4,'Enable','off');
        end
    end
    if sum(Checks)==3
        set(handles.Check_3D,'Enable','inactive');
    else
        set(handles.Check_3D,'Enable','on');
    end
elseif strcmp(val,'Rose-Hindmarsh')
    Checks=[get(handles.Check_port1,'value'),get(handles.Check_port2,'value'),get(handles.Check_port3,'value')];
    if sum(Checks)<legal_check
        set(handles.Check_port1,'Enable','on');
        set(handles.Check_port2,'Enable','on');
        set(handles.Check_port3,'Enable','on');
    else
        runable=true;
        if ~get(handles.Check_port1,'value')
            set(handles.Check_port1,'Enable','off');
        end
        if ~get(handles.Check_port2,'value')
            set(handles.Check_port2,'Enable','off');
        end
        if ~get(handles.Check_port3,'value')
            set(handles.Check_port3,'Enable','off');
        end
    end
    if sum(Checks)==3
        set(handles.Check_3D,'Enable','inactive');
    else
        set(handles.Check_3D,'Enable','on');
    end
elseif strcmp(val,'Thalamic')
    Checks=[get(handles.Check_port1,'value'),get(handles.Check_port2,'value'),get(handles.Check_port3,'value')];
    if sum(Checks)<legal_check
        set(handles.Check_port1,'Enable','on');
        set(handles.Check_port2,'Enable','on');
        set(handles.Check_port3,'Enable','on');
    else
        runable=true;
        if ~get(handles.Check_port1,'value')
            set(handles.Check_port1,'Enable','off');
        end
        if ~get(handles.Check_port2,'value')
            set(handles.Check_port2,'Enable','off');
        end
        if ~get(handles.Check_port3,'value')
            set(handles.Check_port3,'Enable','off');
        end
    end
    if sum(Checks)==3
        set(handles.Check_3D,'Enable','inactive');
    else
        set(handles.Check_3D,'Enable','on');
    end
end
