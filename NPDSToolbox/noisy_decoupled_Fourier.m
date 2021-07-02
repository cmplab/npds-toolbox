%%% THE FOURIER METHOD  FOR SOLVING THE DE-COUPLED MODEL FOR A POPULATION OF NEURONS WITH WHITE NOISE
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% M          Number of time steps
% flag		 (On/Off) Showing plots

%---- Outputs -----
% rho 		  Current distibution
% V		  The error calculated between the current distribution and the final distribution in the past time steps
% thetas      Phase position of the population of uncoupled neurons
% U			  Vlaue of control function
% sim_time    Descrete simulation time
% domain	  Spatial domain points (between 0 and 2*pi)

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

% For more information about the numerical approach, see the package
% documentaion
% Link : www.CMPLAB.com

function [rho,V,thetas,U,sim_time,domain]=noisy_decoupled_Fourier(handles,M,flag)
contents = get(handles.popupm_Init_Dist,'String');
val = contents{get(handles.popupm_Init_Dist,'Value')};
contents = get(handles.popup_Final_Dist,'String');
val2 = contents{get(handles.popup_Final_Dist,'Value')};

contents = get(handles.Popup_PRC,'String');
model = contents{get(handles.Popup_PRC,'Value')};

population=str2double(get(handles.Edit_Pop,'string'));
T=str2double(get(handles.Edit_Oscillator_Period,'string'));
duration=str2double(get(handles.Edit_FinalT,'string'));
D=str2double(get(handles.Edit_Intensity,'string'));

omega=(2*pi)/T;
dt=T/M/8;
k=1:M/2-1;
domain=(0:1:M-1)*2*pi/M;
t=0:dt:duration*T;

[Z,Zp]=PRC_function(model,'Fourier',domain);
prc=Z';
dprc=Zp';
fprc=fft(prc)/M;
c0=fprc(1);
ck=fprc(2:M/2)+flip(fprc(M/2+2:end));
sk=1i*(fprc(2:M/2)-flip(fprc(M/2+2:end)));

rho(1,:)=dist_def(val,str2num(get(handles.Edit_Mean_Initial_Dist,'string')),str2num(get(handles.Edit_Varience_Initial_Dist,'string')),omega,0,dt,domain);
rho_k=fft(rho(1,:))/M;
y0=1/2/pi;
peak1=max(rho(1,:));
% fourier coefficients of initial phase distribution
ak(1,:)=rho_k(2:M/2)+flip(rho_k(M/2+2:end));
bk(1,:)=ak*0;

%Desired distribution
rhof(1,:)=dist_def(val2,str2num(get(handles.Edit_Mean_Final_Dist,'string')),str2double(get(handles.Edit_Varience_Fianl_Dist,'string')),omega,0,dt,domain);
rhof_k=fft(rhof(1,:))/M;
afk(1,:)=rhof_k(2:M/2)+flip(rhof_k(M/2+2:end));
bfk(1,:)=0*afk(1,:);
peak2=max(rhof(1,:));
peak=max(peak1,peak2);

B_2=((2*D/(2*pi))*trapz(domain,(prc.^2)))/2;

%Process type report
report_main(handles,str2num(get(handles.Edit_Mean_Initial_Dist,'string')),str2num(get(handles.Edit_Varience_Initial_Dist,'string')),omega,0,dt,domain);

for j=1:M/2-1
    Ia=fft(rho(1,:).*prc.*sin(domain*k(j)))/M;
    Ika(1,j)=2*Ia(1)*k(j);
    Ib=fft(rho(1,:).*prc.*cos(domain*k(j)))/M;
    Ikb(1,j)=2*Ib(1)*k(j);
end
V(1)=0.5*sum((ak(1,:)-afk(1,:)).^2+(bk(1,:)-bfk(1,:)).^2);
U(1)=noisy_control_input(handles,domain,prc,dprc,V,B_2,omega,1,dt,bk(1,:),bfk(1,:),ak(1,:),afk(1,:),Ika,Ikb,k);

k1=zeros(1,M-2);
k2=zeros(1,M-2);
k3=zeros(1,M-2);
k4=zeros(1,M-2);
kf1=zeros(1,M-2);
kf2=zeros(1,M-2);
kf3=zeros(1,M-2);
kf4=zeros(1,M-2);

thetas=zeros(length(t),population);
thetas(1,:)=(init_tetha(population,rho(1,:),M,domain));
th=linspace(0,2*pi,100);

w=normrnd(0,dt);

%Control inputs
U=zeros(length(t),1);
sim_time=linspace(0,duration*T,length(t));

for i=2:length(t)
    kth1=omega+U(i-1)*(c0+ck*cos(k'*thetas(i-1,:))+sk*sin(k'*thetas(i-1,:)));
    skth1= sqrt(2*D)*(c0+ck*cos(k'*thetas(i-1,:))+sk*sin(k'*thetas(i-1,:)));
    th1=thetas(i-1,:)+kth1*dt*0.5+skth1*w*0.5;
    
    k1(1:M/2-1)=-omega*k.*bk(i-1,:)-U(i-1)*(Ika)-B_2*k.*ak(i-1,:);
    k1(M/2:end)=omega*k.*ak(i-1,:)+U(i-1)*Ikb-B_2*k.*bk(i-1,:);
    ak1=ak(i-1,:)+k1(1:M/2-1)*dt*0.5;
    bk1=bk(i-1,:)+k1(M/2:end)*dt*0.5;
    kf1(1:M/2-1)=-omega*k.*bfk(i-1,:);
    kf1(M/2:end)=omega*k.*afk(i-1,:);
    afk1=afk(i-1,:)+kf1(1:M/2-1)*dt*0.5;
    bfk1=bfk(i-1,:)+kf1(M/2:end)*dt*0.5;
    rho1=y0+ak1*cos(k'*domain)+bk1*sin(k'*domain);
    for j=1:M/2-1
        Ia=fft(rho1.*prc.*sin(domain*k(j)))/M;
        Ika(1,j)=2*Ia(1)*k(j);
        Ib=fft(rho1.*prc.*cos(domain*k(j)))/M;
        Ikb(1,j)=2*Ib(1)*k(j);
    end
    u1=noisy_control_input(handles,domain,prc,dprc,V,B_2,omega,i,dt,bk1,bfk1,ak1,afk1,Ika,Ikb,k);
    
    kth2=omega+u1*(c0+ck*cos(k'*th1)+sk*sin(k'*th1));
    skth2= sqrt(2*D)*(c0+ck*cos(k'*th1)+sk*sin(k'*th1));
    th2=thetas(i-1,:)+kth2*dt*0.5+skth2*w*0.5;
    k2(1:M/2-1)=-omega*k.*bk1-u1*Ika-B_2*k.*ak1;
    k2(M/2:end)=omega*k.*ak1+u1*Ikb-B_2*k.*bk1;
    ak2=ak(i-1,:)+k2(1:M/2-1)*dt*0.5;
    bk2=bk(i-1,:)+k2(M/2:end)*dt*0.5;
    
    kf2(1:M/2-1)=-omega*k.*bfk1;
    kf2(M/2:end)=omega*k.*afk1;
    afk2=afk(i-1,:)+kf2(1:M/2-1)*dt*0.5;
    bfk2=bfk(i-1,:)+kf2(M/2:end)*dt*0.5;
    
    rho2=y0+ak2*cos(k'*domain)+bk2*sin(k'*domain);
    for j=1:M/2-1
        Ia=fft(rho2.*prc.*sin(domain*k(j)))/M;
        Ika(1,j)=2*Ia(1)*k(j);
        Ib=fft(rho2.*prc.*cos(domain*k(j)))/M;
        Ikb(1,j)=2*Ib(1)*k(j);
    end
    u2=noisy_control_input(handles,domain,prc,dprc,V,B_2,omega,i,dt,bk2,bfk2,ak2,afk2,Ika,Ikb,k);
    
    kth3=omega+u2*(c0+ck*cos(k'*th2)+sk*sin(k'*th2));
    skth3=sqrt(2*D)*(c0+ck*cos(k'*th2)+sk*sin(k'*th2));
    th3=thetas(i-1,:)+kth3*dt+skth3*w*0.5;
    k3(1:M/2-1)=-omega*k.*bk2-u2*Ika-B_2*k.*ak2;
    k3(M/2:end)=omega*k.*ak2+u2*Ikb-B_2*k.*bk2;
    ak3=ak(i-1,:)+k3(1:M/2-1)*dt;
    bk3=bk(i-1,:)+k3(M/2:end)*dt;
    kf3(1:M/2-1)=-omega*k.*bfk2;
    kf3(M/2:end)=omega*k.*afk2;
    afk3=afk(i-1,:)+kf3(1:M/2-1)*dt;
    bfk3=bfk(i-1,:)+kf3(M/2:end)*dt;
    
    
    rho3=y0+ak3*cos(k'*domain)+bk3*sin(k'*domain);
    for j=1:M/2-1
        Ia=fft(rho3.*prc.*sin(domain*k(j)))/M;
        Ika(1,j)=2*Ia(1)*k(j);
        Ib=fft(rho3.*prc.*cos(domain*k(j)))/M;
        Ikb(1,j)=2*Ib(1)*k(j);
    end
    u3=noisy_control_input(handles,domain,prc,dprc,V,B_2,omega,i,dt,bk3,bfk3,ak3,afk3,Ika,Ikb,k);
    
    kth4=omega+u3*(c0+ck*cos(k'*th3)+sk*sin(k'*th3));
    skth4=sqrt(2*D)*(c0+ck*cos(k'*th3)+sk*sin(k'*th3));
    thetas(i,:)=thetas(i-1,:)+(dt*(kth1+2*kth2+2*kth3+kth4)+w*(skth1+2*skth2+2*skth3+skth4))/6;
    k4(1:M/2-1)=-omega*k.*bk3-u3*Ika-B_2*k.*ak3;
    k4(M/2:end)=omega*k.*ak3+u3*Ikb-B_2*k.*bk3;
    
    ak(i,:)=ak(i-1,:)+dt*(k1(1:M/2-1)+2*k2(1:M/2-1)+2*k3(1:M/2-1)+k4(1:M/2-1))/6;
    bk(i,:)=bk(i-1,:)+dt*(k1(M/2:end)+2*k2(M/2:end)+2*k3(M/2:end)+k4(M/2:end))/6;
    
    kf4(1:M/2-1)=-omega*k.*bfk3;
    kf4(M/2:end)=omega*k.*afk3;
    
    afk(i,:)=afk(i-1,:)+dt*(kf1(1:M/2-1)+2*kf2(1:M/2-1)+2*kf3(1:M/2-1)+kf4(1:M/2-1))/6;
    bfk(i,:)=bfk(i-1,:)+dt*(kf1(M/2:end)+2*kf2(M/2:end)+2*kf3(M/2:end)+kf4(M/2:end))/6;
    
    rho(i,:)=y0+ak(i,:)*cos(k'*domain)+bk(i,:)*sin(k'*domain); %numerical sol
    for j=1:M/2-1
        Ia=fft(rho(i,:).*prc.*sin(domain*k(j)))/M;
        Ika(1,j)=2*Ia(1)*k(j);
        Ib=fft(rho(i,:).*prc.*cos(domain*k(j)))/M;
        Ikb(1,j)=2*Ib(1)*k(j);
    end
    V(i)=0.5*sum(((ak(i,:)-afk(i,:)).^2+(bk(i,:)-bfk(i,:)).^2));
    U(i)=noisy_control_input(handles,domain,prc,dprc,V,B_2,omega,i,dt,bk(i,:),bfk(i,:),ak(i,:),afk(i,:),Ika,Ikb,k);
    rhof(i,:)=y0+afk(i,:)*cos(k'*domain)+bfk(i,:)*sin(k'*domain);
    
    if (flag)
        Output_plots(handles,peak,duration*T,domain,rho(i,:),rhof(i,:),sim_time(1:i),U(1:i),V(1:i),cos(thetas(i,:)),sin(thetas(i,:)),cos(th),sin(th));
        pause(0.05)
        
        
        if abs(trapz(domain,rho(i,:))-1)>2
            errordlg('Method is unstable','Unstablity Error');
            break;
        end
        if ~get(handles.Start_button, 'userdata') % stop condition
            break;
        end
        
        if get(handles.Pause_button, 'userdata') % stop condition
            while get(handles.Pause_button, 'userdata')
                pause(0.1)
            end
        end
    end
end
report_last(handles.Text_result,sim_time,U,V,thetas,rho,i)