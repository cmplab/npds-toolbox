% DRAWS THE DYNAMICS OF ODES
% NPDSToolbox version 1.0.0
% varargin  parameters according to the input model

% -----Input arguments based on model selection-----
%       IF nargin = 7 'Hudgkin-Huxley' model
%                   input argumant  RKb(..)(7 args)
%                   According to the input arguments, the function solves the
%                   mentioned model using the ode45(..) "medium order
%                   non-stiff DEs solver" and gives the results as a result matrix
%                   (res) and a steps vector (dt).
%                   for more information see ode45(..) help
%                   link: https://www.mathworks.com/help/matlab/ref/ode45.html
%       IF nargin = 12 'Rose-Hindmarsh' model
%                   input argumant  RKb(..)(12 args)
%                   According to the input arguments, the function solves the
%                   mentioned model using the ode15s(..) "variable order
%                   stiff DEs solver" and gives the results as a result matrix
%                   (res) and a steps vector (dt).
%                   for more information see ode15s(..) help
%                   link: https://www.mathworks.com/help/matlab/ref/ode15s.html
%       IF nargin = 13 'Hudgkin-Huxley' model
%                   input argumant  RKb(..)(13 args)
%                   According to the input arguments, the function solves the
%                   mentioned model using the ode23t(..) "moderately
%                   stiff DEs solver" and gives the results as a result matrix
%                   (res) and a steps vector (dt).
%                   for more information see ode23t(..) help
%                   link: https://www.mathworks.com/help/matlab/ref/ode23t.html
%       IF nargin = 14 'Thalamic' model
%                   input argumant  RKb(..)(14 args)
%                   According to the input arguments, the function solves the
%                   mentioned model using the ode23t(..) "moderately
%                   stiff DEs solver" and gives the results as a result matrix
%                   (res) and a steps vector (dt).
%                   for more information see ode23t(..) help
%                   link: https://www.mathworks.com/help/matlab/ref/ode23t.html



% -----applied references for models in this code-----
%           'Hudgkin-Huxley'    E. M. Izhikevich, Dynamical Systems in
%                               Neuroscience: The Geometry of Excitability
%                               and Bursting, 2007, MIT Press
%           'Fitzhugh-Nagumo'   E. M. Izhikevich, Dynamical Systems in
%                               Neuroscience: The Geometry of Excitability
%                               and Bursting, 2007, MIT Press
%           'Rose-Hindmarsh'    J. L. Hindmarsh and R. M. Rose, A model of
%                               neuronal bursting using three coupled first
%                               order differential equations, 1984,
%                               Proc R Soc London, Ser B
%           'Thalamic'          B. Monga, D. Wilson, T. Matchen and J. Moehlis
%                               Phase reduction and phase-based optimal control
%                               for biological systems: a tutorial, 2019,
%                               Biological Cybernetics , 113, 11-19
%
%----------------------------------------------------

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)


function [res,dt]=RKb(varargin)
tspan = [0 varargin{nargin}];
if nargin==7
    y0=[varargin{1},varargin{2}];
    I=varargin{3};a=varargin{4};b=varargin{5};c=varargin{6};
    [res,dt]=ode45(@(t,y)FHN(t,y,I,a,b,c),tspan,y0);
elseif nargin==12
    y0=[varargin{1},varargin{2},varargin{3}];
    I=varargin{4};a=varargin{5};b=varargin{6};c=varargin{7};
    d=varargin{8};r=varargin{9};s=varargin{10};Xr=varargin{11};
    [res,dt]=ode15s(@(t,y)RH(t,y,I,a,b,c,d,r,s,Xr),tspan,y0);
elseif nargin==13
    y0=[varargin{1},varargin{2},varargin{3},varargin{4}];
    I=varargin{5};a=varargin{6};b=varargin{7};c=varargin{8};
    d=varargin{9};e=varargin{10};f=varargin{11};C=varargin{12};
    [res,dt]=ode23tb(@(t,y)HH(t,y,I,a,b,c,d,e,f,C),tspan,y0);
elseif nargin==14
    y0=[varargin{1},varargin{2},varargin{3}];
    I=varargin{4};eNa=varargin{5};eK=varargin{6};eL=varargin{7};
    eT=varargin{8};gNa=varargin{9};gK=varargin{10};gL=varargin{11};
    gT=varargin{12};C=varargin{13};
    [res,dt]=ode23tb(@(t,y)Thalamic(t,y,I,eNa,eK,eL,eT,gNa,gK,gL,gT,C),tspan,y0);
else
end
end

function dydt = HH(t,y,I,a,b,c,d,e,f,C)
dydt= [(I-e*y(4)^4*(y(1)-b)-d*y(2)^3*y(3)*(y(1)-a)-f*(y(1)-c))/C;...
    (0.1*(25-y(1))/(exp((25-y(1))/10)-1))*(1-y(2))-(4*exp(-y(1)/18))*y(2);...
    (0.07*exp(-y(1)/20))*(1-y(3))-(1/(exp((30-y(1))/10)+1))*y(3);...
    (0.01*(10-y(1))/(exp((10-y(1))/10)-1))*(1-y(4))-(0.125*exp(-y(1)/80))*y(4)];
end

function dydt=FHN(t,y,I,a,b,c)
dydt=[I+y(1)-y(1)^3/3-y(2);a*(y(1)+b-c*y(2))];
end

function dydt=RH(t,y,I,a,b,c,d,r,s,Xr)
dydt=[y(2)+(b*y(1)^2)-(a*y(1)^3)-y(3)+I;...
    c-(d*y(1)^2)-y(2);...
    r*(s*(y(1)-Xr)-y(3))];
end

function dydt=Thalamic(t,y,I,eNa,eK,eL,eT,gNa,gK,gL,gT,C)
dydt=[(-(gL*(y(1)-eL))-(gNa*((1/(1+exp(-(y(1)+37)/7)))^3)*y(2)*(y(1)-eNa))-(gK*((0.75*(1-y(2)))^4)*(y(1)-eK))-(gT*((1/(1+exp(-(y(1)+60)/6.2)))^2)*y(3)*(y(1)-eT))+I)/C;...
    ((1/(1+exp((y(1)+41)/4)))-y(2))/(1/((0.128*exp(-(y(1)+46)/18))+(4/(1+exp(-(y(1)+23)/5)))));...
    ((1/(1+exp((y(1)+84)/4)))-y(3))/(28+exp(-(y(1)+25)/10.5))];
end