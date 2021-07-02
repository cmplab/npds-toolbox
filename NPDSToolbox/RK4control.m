%%% FOURTH-ORDER  RUNGE-KUTTA ALGORITHM FOR SOLVING ODE
% NPDSToolbox version 1.0.0
% tts			Spatial domain points (between 0 and 2*pi)
% u			    Vlaue of control function
% T             Time period of oscillation
% dt			Time step value
% prc			Phase responce curve vector
% type			type of PRC

%---- OUTPUT ----
% L				New population phase

% In this code, the obtained control value is applied to the population of neurons and their new phases are calculated.

%-------- APPLIED REFRENCES --------
%				MONGA, Bharat; MOEHLIS, Jeff.
%			    Phase distribution control of a population of
%				oscillators, 2019,
%				Physica D: Nonlinear Phenomena, 398: 115-129.




function L=RK4control(tts,u,T,dt,prc,type)
step=1;
h=dt/step;
omega=2*pi/T;
PRC=PRC_function(prc,type,tts);
f=@(TTS,U) omega+U.*PRC';
y=zeros(step+1,size(tts,2));
y(1,:)=tts;
for i=1:step
    kth1=f(y(i,:),u);
    th1=y(i,:)+kth1*h*0.5;
    kth2=f(th1,u);
    th2=y(i,:)+kth2*h*0.5;
    kth3=f(th2,u);
    th3=y(i,:)+kth3*h;
    kth4=f(th3,u);
    y(i+1,:)=y(i,:)+h*(kth1+2*kth2+2*kth3+kth4)/6;
end
L=mod(y(i+1,:),2*pi);
end
