%CALCULATE THE AMOUNT OF CONTROL ACCORDING TO THE SELECTED CONTROL FUNCTION
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% domain     Spatial domain points (between 0 and 2*pi)
% Z			 Phase responce curve nodes
% Zp         Derivative of phase responce curve nodes
% L2         The error calculated between the current distribution and the final distribution in the past time steps
% omega      Periodic orbit value
% i          Current time step
% dt         Time step value
% varargin   Additional arguments depending on the type of control

% The function control_input(...) calculates four different controls based on the number of input arguments.
%---- Type of controls%----
%	number of arguments -> control
%			10 			-> Proportional control or Bang-bang control
%			 9			-> calls user_defined_control(..) for user-defined control (Except for the Fourier method)
%			12			-> calls user_defined_control(..) for user-defined control (Fourier method)
%-------------------------

% -----applied references for models in this code-----
%           	                B. Monga, D. Wilson, T. Matchen and J. Moehlis
%                               Phase reduction and phase-based optimal control
%                               for biological systems: a tutorial, 2019,
%                               Biological Cybernetics , 113, 11-19
%
%								MONGA, Bharat; MOEHLIS, Jeff.
%							    Phase distribution control of a population of
%							    oscillators, 2019,
%							    Physica D: Nonlinear Phenomena, 398: 115-129.â€?
%
%----------------------------------------------------



function u=control_input(handles,domain,Z,Zp,L2,omega,i,dt,varargin)
if nargin==10
    phi=varargin{1};
    phif=varargin{2};
    I=(trapz(domain,(phi-phif).*Zp'.*phi));
else
    bk=varargin{1};bfk=varargin{2};ak=varargin{3};afk=varargin{4};Ika=varargin{5};Ikb=varargin{6};
    I=-sum( (bk-bfk).*Ikb - (ak-afk).*Ika);
end
if get(handles.radiobutton_control_proportional,'value')
    u_max=str2double(get(handles.Edit_Umax,'string'));
    u_min=str2double(get(handles.Edit_Umin,'string'));
    K=str2double(get(handles.Edit_K,'string'));
    u=max(min(u_max,K*I),u_min);
elseif get(handles.radiobutton_control_BangBang,'value')
    u_max=str2double(get(handles.Edit_Umax,'string'));
    u_min=str2double(get(handles.Edit_Umin,'string'));
    if I>0
        u=u_max;
    else
        u=u_min;
    end
elseif get(handles.radiobutton_control_Specified,'value')
    contents = get(handles.Popup_Method,'String');
    val = contents{get(handles.Popup_Method,'Value')};
    
    if strcmp(val,'Fourier')
        u=user_defined_control(domain,Z,Zp,omega,i,dt,bk,bfk,ak,afk,Ika,Ikb);%12
    else
        u=user_defined_control(domain,phi,phif,Z,Zp,L2,omega,i,dt);%9
    end
end



