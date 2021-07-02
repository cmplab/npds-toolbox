%%% DRAWS THE PHASE PORTRAIT, STREAM AND VECTORFIELD
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% H          handle of axes (portraite axes)
% vector     active dimensions for drawing portrait
% flag       A number to identify the model
% varargin   Additional parameters according to the input model

% -----Input arguments based on model selection-----
%       IF flag = 1 'Hudgkin-Huxley' model
%                   input argumant is Portraite(handles,H,[v,m,n,h],1,...
%                   all of slider values and parameter values)(17 args).
%                   "vector" is a binary  4-elements vector, for example [1,1,0,0]
%                   means that draw 2D portraite based on values of dimesions
%                   v and n. If vector has three elements equal to 1, for example [1,1,1,0]
%                   means that draw 3D portrait based on three valid
%                   dimensions, in here v, n and h.
%       IF flag = 2 'Fitzhugh-Nagumo' model
%                   input argumant is Portraite(handles,H,[V,W,0,0],2,...
%                   all of slider values and parameter values )(11 args)
%                   "vector" is a binary 4-elements vector, for example [1,1,0,0]
%                   means that draw 2D portrait based on values of dimesions
%                   V, and W. Note that only 2D option is possible for this
%                   model.
%       IF flag = 3 'Rose-Hindmarsh' model
%                   input argumant is Portraite(handles,H,[x,y,z,0],3,...
%                   all of slider values and parameter values )(16 args)
%                   "vector" is a binary 4-elements vector, for example [1,1,0,0]
%                   means that draw 2D portrait based on values of dimesions
%                   x and y, if vector has three elements equal to 1, for example [1,1,1,0]
%                   means that draw 3D portrait based on three valid
%                   dimensions, in here x, y and z.
%       IF flag = 4 'Thalamic' model
%                   input argumant is Portraite(handles,H,[v,h,r,0],4,...
%                   all of slider values and parameter values)(18 args)
%                   "vector" is a binary 4-elements vector, for example [1,1,0,0]
%                   means that draw 2D portrait based on values of dimesions
%                   v and h. If vector has three elements equal to 1, for example [1,1,1,0]
%                   means that draw 3D portrait based on three valid
%                   dimensions, in here v, h and r.

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


function Portraite(handles,H,vector,flag,varargin)
tspan = [0 ,varargin{end}];
t=0;
H_visible=get(H,'visible');
vf_situation=get(handles.vftoggletool,'state');
st_situation=get(handles.strtoggletool,'state');
if  H_visible(2)=='n'
    if flag==1
        y0=[varargin{1},varargin{2},varargin{3},varargin{4}];
        I=varargin{5};a=varargin{6};b=varargin{7};c=varargin{8};
        d=varargin{9};e=varargin{10};f=varargin{11};C=varargin{12};
        f=@(t,y)HH2D(vector,t,y,I,a,b,c,d,e,f,C,y0);
        label=['v','m','h','n'];
        %cla(H);
        %hold on
        y0_andix=find(vector);
        y0_Nandix=find(~vector);
        [ts,ys] = ode23tb(f,tspan,y0);
        if size(y0_andix,2)==2
            plot(H,ys(:,y0_andix(1)),ys(:,y0_andix(2)),'k',ys(1,y0_andix(1)),ys(1,y0_andix(2)),'*',ys(end,y0_andix(1)),ys(end,y0_andix(2)),'o','LineWidth',2);
            xbnd=get(H,'xlim');
            ybnd=get(H,'ylim');
            xlabel(H,label(y0_andix(1)));
            ylabel(H,label(y0_andix(2)));
            ys1=linspace(xbnd(1),xbnd(2),10);
            ys2=linspace(ybnd(1),ybnd(2),10);
            if  vf_situation(2)=='n'
                hold(H,'on');
                vectfield(H,f,ys1,ys2,t,flag,y0_andix,y0_Nandix,[y0(y0_Nandix)]);
                hold(H,'off');
            end
            if st_situation(2)=='n'
                stream(H,f,ys1,ys2,t,flag,y0_andix,y0_Nandix,[y0(y0_Nandix)]);
            end
        elseif size(y0_andix,2)==3
            plot3(H,ys(:,y0_andix(1)),ys(:,y0_andix(2)),ys(:,y0_andix(3)),'k',ys(1,y0_andix(1)),ys(1,y0_andix(2)),ys(1,y0_andix(3)),'*',...
                ys(end,y0_andix(1)),ys(end,y0_andix(2)),ys(end,y0_andix(3)),'o','LineWidth',2 );
            xbnd=get(H,'xlim');
            ybnd=get(H,'ylim');
            zbnd=get(H,'zlim');
            xlabel(H,label(y0_andix(1)));
            ylabel(H,label(y0_andix(2)));
            zlabel(H,label(y0_andix(3)));
            ys1=linspace(xbnd(1),xbnd(2),10);
            ys2=linspace(ybnd(1),ybnd(2),10);
            ys3=linspace(zbnd(1),zbnd(2),10);
            if  vf_situation(2)=='n'
                hold(H,'on');
                vectfield3d(H,f,ys1,ys2,ys3,t,y0_andix,y0_Nandix,[y0(y0_Nandix)]);
                hold(H,'off');
            end
            if st_situation(2)=='n'
                stream3d(H,f,ys1,ys2,ys3,t,y0_andix,y0_Nandix,[y0(y0_Nandix)]);
            end
        end
    elseif flag==2
        y0=[varargin{1},varargin{2}];
        I=varargin{3};a=varargin{4};b=varargin{5};c=varargin{6};
        f = @(t,Y) [I+Y(1)-Y(1)^3/3-Y(2);a*(Y(1)+b-c*Y(2))];
        y0_andix=find(vector);
        [ts,ys] = ode45(f,tspan,y0);
        plot(H,ys(:,y0_andix(1)),ys(:,y0_andix(2)),'k',ys(1,y0_andix(1)),ys(1,y0_andix(2)),'*',ys(end,y0_andix(1)),ys(end,y0_andix(2)),'o','LineWidth',2);
        xbnd=get(H,'xlim');
        ybnd=get(H,'ylim');
        ys1=linspace(xbnd(1),xbnd(2),11);
        ys2=linspace(ybnd(1),ybnd(2),11);
        if  vf_situation(2)=='n'
            hold(H,'on');
            vectfield(H,f,ys1,ys2,t);
            hold(H,'off');
        end
        if st_situation(2)=='n'
            stream(H,f,ys1,ys2,t);
        end
        xlabel(H,'V');
        ylabel(H,'W');
    elseif flag==3
        y0=[varargin{1},varargin{2},varargin{3}];
        I=varargin{4};a=varargin{5};b=varargin{6};c=varargin{7};
        d=varargin{8};r=varargin{9};s=varargin{10};Xr=varargin{11};
        f=@(t,y) RH2D(vector,t,y,I,a,b,c,d,r,s,Xr,y0);
        label=['x','y','z'];
        y0_andix=find(vector);
        y0_Nandix=find(~vector);
        [ts,ys] = ode45(f,tspan,y0);
        if size(y0_andix,2)==2
            plot(H,ys(:,y0_andix(1)),ys(:,y0_andix(2)),'k',ys(1,y0_andix(1)),ys(1,y0_andix(2)),'*',ys(end,y0_andix(1)),ys(end,y0_andix(2)),'o','LineWidth',2);
            xbnd=get(H,'xlim');
            ybnd=get(H,'ylim');
            xlabel(H,label(y0_andix(1)));
            ylabel(H,label(y0_andix(2)));
            ys1=linspace(xbnd(1),xbnd(2),11);
            ys2=linspace(ybnd(1),ybnd(2),11);
            if  vf_situation(2)=='n'
                hold(H,'on');
                vectfield(H,f,ys1,ys2,t,flag,y0_andix,y0_Nandix(1),[y0(y0_Nandix(1))]);
                hold(H,'off');
            end
            if st_situation(2)=='n'
                stream(H,f,ys1,ys2,t,flag,y0_andix,y0_Nandix(1),[y0(y0_Nandix(1))]);
            end
        elseif size(y0_andix,2)==3
            plot3(H,ys(:,y0_andix(1)),ys(:,y0_andix(2)),ys(:,y0_andix(3)),'k',ys(1,y0_andix(1)),ys(1,y0_andix(2)),ys(1,y0_andix(3)),'*',...
                ys(end,y0_andix(1)),ys(end,y0_andix(2)),ys(end,y0_andix(3)),'o','LineWidth',2 );
            xbnd=get(H,'xlim');
            ybnd=get(H,'ylim');
            zbnd=get(H,'zlim');
            xlabel(H,label(y0_andix(1)));
            ylabel(H,label(y0_andix(2)));
            zlabel(H,label(y0_andix(3)));
            ys1=linspace(xbnd(1),xbnd(2),11);
            ys2=linspace(ybnd(1),ybnd(2),11);
            ys3=linspace(zbnd(1),zbnd(2),11);
            if  vf_situation(2)=='n'
                hold(H,'on');
                vectfield3d(H,f,ys1,ys2,ys3,t,y0_andix);
                hold(H,'off');
            end
            if st_situation(2)=='n'
                stream3d(H,f,ys1,ys2,ys3,t,y0_andix);
            end
        end
    elseif flag==4
        y0=[varargin{1},varargin{2},varargin{3}];
        I=varargin{4};eNa=varargin{5};eK=varargin{6};eL=varargin{7};
        eT=varargin{8};gNa=varargin{9};gK=varargin{10};gL=varargin{11};
        gT=varargin{12};C=varargin{13};
        f=@(t,y) Thalamic2D(vector,t,y,I,eNa,eK,eL,eT,gNa,gK,gL,gT,C,y0);
        label=['v','h','r'];
        y0_andix=find(vector);
        y0_Nandix=find(~vector);
        [ts,ys] = ode23tb(f,tspan,y0);
        if size(y0_andix,2)==2
            plot(H,ys(:,y0_andix(1)),ys(:,y0_andix(2)),'k',ys(1,y0_andix(1)),ys(1,y0_andix(2)),'*',ys(end,y0_andix(1)),ys(end,y0_andix(2)),'o','LineWidth',2);
            xbnd=get(H,'xlim');
            ybnd=get(H,'ylim');
            xlabel(H,label(y0_andix(1)));
            ylabel(H,label(y0_andix(2)));
            ys1=linspace(xbnd(1),xbnd(2),11);
            ys2=linspace(ybnd(1),ybnd(2),11);
            if  vf_situation(2)=='n'
                hold(H,'on');
                vectfield(H,f,ys1,ys2,t,flag,y0_andix,y0_Nandix(1),[y0(y0_Nandix(1))]);
                hold(H,'off');
            end
            if st_situation(2)=='n'
                stream(H,f,ys1,ys2,t,flag,y0_andix,y0_Nandix(1),[y0(y0_Nandix(1))]);
            end
        elseif size(y0_andix,2)==3
            plot3(H,ys(:,y0_andix(1)),ys(:,y0_andix(2)),ys(:,y0_andix(3)),'k',ys(1,y0_andix(1)),ys(1,y0_andix(2)),ys(1,y0_andix(3)),'*',...
                ys(end,y0_andix(1)),ys(end,y0_andix(2)),ys(end,y0_andix(3)),'o','LineWidth',2 );
            xbnd=get(H,'xlim');
            ybnd=get(H,'ylim');
            zbnd=get(H,'zlim');
            xlabel(H,label(y0_andix(1)));
            ylabel(H,label(y0_andix(2)));
            zlabel(H,label(y0_andix(3)));
            ys1=linspace(xbnd(1),xbnd(2),11);
            ys2=linspace(ybnd(1),ybnd(2),11);
            ys3=linspace(zbnd(1),zbnd(2),11);
            if  vf_situation(2)=='n'
                hold(H,'on');
                vectfield3d(H,f,ys1,ys2,ys3,t,y0_andix);
                hold(H,'off');
            end
            if st_situation(2)=='n'
                stream3d(H,f,ys1,ys2,ys3,t,y0_andix);
            end
        end
        
    end
end
end

function dydt=HH2D(vector,t,y,I,a,b,c,d,e,f,C,y0)
dydt= [(I-e.*y(4).^4.*(y(1)-b)-d.*y(2).^3.*y(3).*(y(1)-a)-f*(y(1)-c))./C;...
    (0.1.*(25-y(1))./(exp((25-y(1))./10)-1)).*(1-y(2))-(4.*exp(-y(1)./18)).*y(2);...
    (0.07.*exp(-y(1)./20)).*(1-y(3))-(1./(exp((30-y(1))./10)+1)).*y(3);...
    (0.01.*(10-y(1))./(exp((10-y(1))./10)-1)).*(1-y(4))-(0.125.*exp(-y(1)./80)).*y(4)];
end

function dydt=RH2D(vector,t,y,I,a,b,c,d,r,s,Xr,y0)
dydt=[y(2)+(b*y(1)^2)-(a*y(1)^3)-y(3)+I;...
    c-(d*y(1)^2)-y(2);...
    r*(s*(y(1)-Xr)-y(3))];
end

function dydt=Thalamic2D(vector,t,y,I,eNa,eK,eL,eT,gNa,gK,gL,gT,C,y0)
dydt=[(-(gL*(y(1)-eL))-(gNa*((1/(1+exp(-(y(1)+37)/7)))^3)*y(2)*(y(1)-eNa))-(gK*((0.75*(1-y(2)))^4)*(y(1)-eK))-(gT*((1/(1+exp(-(y(1)+60)/6.2)))^2)*y(3)*(y(1)-eT))+I)/C;...
    ((1/(1+exp((y(1)+41)/4)))-y(2))/(1/((0.128*exp(-(y(1)+46)/18))+(4/(1+exp(-(y(1)+23)/5)))));...
    ((1/(1+exp((y(1)+84)/4)))-y(3))/(28+exp(-(y(1)+25)/10.5))];
end