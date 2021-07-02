%%% THE FINITE DIFFERENCE METHOD FOR SOLVING THE DE-COUPLED MODEL FOR A POPULATION OF NEURONS WITHOUT WHITE NOISE
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% M          Number of time steps
% flag		 (On/Off) Showing plots

%---- Outputs ----
% phi 		  Current distibution
% L2		  The error calculated between the current distribution and the final distribution in the past time steps
% thetas      Phase of the population of neurons
% u			  Vlaue of control function
% sim_time    Descrete simulation time
% x			  Spatial domain points (between 0 and 2*pi)

% For more information about the numerical approach, see the package
% documentaion
% Link : www.CMPLAB.com



function [phi,L2,thetas,u,sim_time,x]=decoupled_FD(handles,M,flag)
contents = get(handles.popupm_Init_Dist,'String');
val = contents{get(handles.popupm_Init_Dist,'Value')};
contents = get(handles.popup_Final_Dist,'String');
val2 = contents{get(handles.popup_Final_Dist,'Value')};

contents = get(handles.Popup_PRC,'String');
model = contents{get(handles.Popup_PRC,'Value')};

population=str2double(get(handles.Edit_Pop,'string'));
T=str2double(get(handles.Edit_Oscillator_Period,'string'));
duration=str2double(get(handles.Edit_FinalT,'string'));

omega=(2*pi)/T;
N=200;
dt=T/M;
S=duration*M;
dx=2*pi/(N-1);

x=(0:dx:2*pi);

[Z,Zp]=PRC_function(model,'FD',x);

%Initial condition
phi(1,:)=dist_def(val,str2num(get(handles.Edit_Mean_Initial_Dist,'string')),str2num(get(handles.Edit_Varience_Initial_Dist,'string')),omega,0,dt,x);
peak1=max(phi(1,:));

%Desired distribution
phif(1,:)=dist_def(val2,str2num(get(handles.Edit_Mean_Final_Dist,'string')),str2num(get(handles.Edit_Varience_Fianl_Dist,'string')),omega,0,dt,x);
peak2=max(phif(1,:));
peak=max(peak1,peak2);

%Control inputs
u=zeros(S+1,1);
sim_time=linspace(0,duration*T,S+1);
%L_2 norms
L2=zeros(S+1,1);
L2(1)=trapz(x,(phi(1,:)-phif(1,:)).^2);

%Initial oscillators
thetas=zeros(S,population);
th=linspace(0,2*pi,100);
thetas(1,:)=(init_tetha(population,phi(1,:),N,x))';

%Process type report
report_main(handles,str2num(get(handles.Edit_Mean_Initial_Dist,'string')),str2num(get(handles.Edit_Varience_Initial_Dist,'string')),omega,0,dt,x);

for i=1:S
    A=zeros(N,N);
    A(1,N-1)=((-omega*dt)-(u(i)*dt*Z(1)))/(2*dx);
    A(1,1)=1+dt*u(i)*Zp(1);
    A(1,2)=((omega*dt)+(u(i)*dt*Z(1)))/(2*dx);
    
    A(N,N-1)=((-omega*dt)-(u(i)*dt*Z(N)))/(2*dx);
    A(N,N)=1+dt*u(i)*Zp(N);
    A(N,2)=((omega*dt)+(u(i)*dt*Z(N)))/(2*dx);
    
    for j=2:N-1
        A(j,j-1)=((-omega*dt)-(u(i)*dt*Z(j)))/(2*dx);
        A(j,j)=1+dt*u(i)*Zp(j);
        A(j,j+1)=((omega*dt)+(u(i)*dt*Z(j)))/(2*dx);
    end
    B=phi(i,:);
    phi(i+1,:)=(A\B');
    phif(i+1,:)=dist_def(val2,str2num(get(handles.Edit_Mean_Final_Dist,'string')),str2num(get(handles.Edit_Varience_Fianl_Dist,'string')),omega,i,dt,x);
    L2(i+1)=trapz(x,(phi(i+1,:)-phif(i+1,:)).^2);
    u(i+1)=control_input(handles,x,Z,Zp,L2,omega,i,dt,phi(i,:),phif(i,:));
    thetas(i+1,:)=RK4control(thetas(i,:),u(i+1),T,dt,model,'FD');
    
    
    if(flag)
        Output_plots(handles,peak,duration*T,x,phi(i,:),phif(i,:),sim_time(1:i),u(1:i),L2(1:i),cos(thetas(i,:)),sin(thetas(i,:)),cos(th),sin(th));
        
        
        
        if abs(trapz(x,phi(i,:))-1)>2
            errordlg('Method is unstable','Unstablity Error');
            break;
        end
        
        if ~get(handles.Start_button, 'userdata') % stop condition
            break;
        end
        
        if get(handles.Pause_button, 'userdata') % pause condition
            while get(handles.Pause_button, 'userdata')
                pause(0.1)
            end
        end
    end
end
report_last(handles.Text_result,sim_time,u',L2,thetas,phi,i)
