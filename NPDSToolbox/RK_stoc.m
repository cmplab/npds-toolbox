%%% FOURTH-ORDER STOCHASTIC RUNGE-KUTTA ALGORITHM FOR SOLVING STOCHASTIC ODE
% NPDSToolbox version 1.0.0
% tts			Spatial domain points (between 0 and 2*pi)
% u			    Vlaue of control function
% T             Time period of oscillation
% dt			Time step value
% D				Noise intensity
% prc			Phase responce curve vector
% type			type of PRC

%---- OUTPUT ----
% L				New population phase

%In this code, the obtained control value is applied to the population of neurons and their new phases are calculated.

%-------- APPLIED REFRENCES --------
%				MONGA, Bharat; MOEHLIS, Jeff.
%			    Phase distribution control of a population of
%				oscillators, 2019,
%				Physica D: Nonlinear Phenomena, 398: 115-129.



function L=RK_stoc(tts,u,T,dt,D,prc,type)
%Steps of Runge--Kutta algorithm
step=3;
%Size of the each step
h=dt/step;
omega=2*pi/T;
PRC=PRC_function(prc,type,tts);

f=@(TTS,U) omega+U.*PRC';
g=@(TTS,D) sqrt(2*D)*PRC';

y=zeros(step+1,size(tts,2));
y(1,:)=tts;

for i=1:step
    w=normrnd(0,h);
    kth1=f(y(i,:),u);
    skth1=g(y(i,:),D);
    th1=y(i,:)+kth1*h*0.5+skth1*w*0.5;
    kth2=f(th1,u);
    skth2=g(th1,D);
    th2=y(i,:)+kth2*h*0.5+skth2*w*0.5;
    kth3=f(th2,u);
    skth3=g(th2,D);
    th3=y(i,:)+kth3*h+skth3*w;
    kth4=f(th3,u);
    skth4=g(th3,D);
    
    y(i+1,:)=y(i,:)+1/6*(h*(kth1+2*kth2+2*kth3+kth4)+(w*(skth1+2*skth2+2*skth3+skth4)));
end
%New phase of oscillators
L=mod(y(i+1,:),2*pi);
end