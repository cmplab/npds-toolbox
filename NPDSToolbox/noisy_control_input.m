%%%CALCULATES THE AMOUNT OF CONTROL ACCORDING TO THE SELECTED CONTROL FUNCTION (WITH NOISE)
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% domain     Spatial domain points (between 0 and 2*pi)
% Z			 Phase responce curve nodes
% Zp         Derivative of phase responce curve nodes
% L2         The error calculated between the current distribution and the final distribution in the past time steps
% B          Noise term , See ref #1
% omega      Periodic orbit value
% i          Current time step
% dt         Time step value
% varargin   Additional arguments depending on the type of control

% The function noisy_control_input(...) calculates four different controls based on the number of input arguments.
%----- Type of controls-----
%	number of arguments -> control
%			13 			-> Proportional control or Bang-bang control
%			13			-> calls user_defined_control(..) for user-defined control (Except for the Fourier method)
%			15			-> calls user_defined_control(..) for user-defined control (Fourier method)


% -----applied references for models in this code-----
%           	                B. Monga, D. Wilson, T. Matchen and J. Moehlis
%                               Phase reduction and phase-based optimal control
%                               for biological systems: a tutorial, 2019,
%                               Biological Cybernetics , 113, 11-19
%
%								Monga, Bharat, MOEHLIS, Jeff.
%							    Phase distribution control of a population of
%							    oscillators, 2019,
%							    Physica D: Nonlinear Phenomena, 398:115-129.
%
%----------------------------------------------------




function u=noisy_control_input(handles,domain,Z,Zp,L2,B,omega,i,dt,varargin)
if nargin==13
    phi=varargin{1};phif=varargin{2};dphi=varargin{3};dphif=varargin{4};
    I=(trapz(domain,(phi-phif).*Zp'.*phi));
    G=-B*(trapz(domain,(dphi-dphif).*dphi));
else
    bk=varargin{1};bfk=varargin{2};ak=varargin{3};afk=varargin{4};Ika=varargin{5};Ikb=varargin{6};k=varargin{7};
    I=sum( (bk-bfk).*Ikb - (ak-afk).*Ika);
    G=-B*sum(k.^2.*(ak.*(ak-afk)+bk.*(bk-bfk)));
end
if get(handles.radiobutton_control_proportional,'value')
    u_max=str2double(get(handles.Edit_Umax,'string'));
    u_min=str2double(get(handles.Edit_Umin,'string'));
    K=str2double(get(handles.Edit_K,'string'));
    u=max(min(u_max,K*I+(G/I)),u_min);
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
        u=user_defined_control(domain,Z,Zp,omega,i,dt,B,str2double(get(handles.Edit_Intensity,'string')),bk,bfk,ak,afk,Ika,Ikb,k);%15
    else
        u=user_defined_control(domain,phi,phif,Z,Zp,L2,omega,i,dt,B,dphi,dphif,str2double(get(handles.Edit_Intensity,'string')));%13
    end
end



