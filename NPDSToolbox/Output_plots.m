%%% DISPLAYS PLOTS RELATED TO THE CONTROL MODEL
% NPDSToolbox version 1.0.0
%	handles    	Structure with handles and user data (see GUIDATA)
%	peak	   	Absolute maximum of distribution function
%	durT	   	Total simulation time
%	x		   	Spatial domain points (between 0 and 2*pi)
% 	phi 	   	Current distibution
%   phif	   	Final distribution
% 	sim_time   	Discrete simulation time
%	u		   	Vlaue of control function
%	L2         	The error calculated between the current distribution and the final distribution in the past time steps
%	cos_thetas 	The cosine angle of the population phase of the neurons
%	sin_thetas	The Sinusoidal angle of the population phase of the neurons
%	cos_th	    Accuracy drawing parameter
%	sin_th	    Accuracy drawing parameter

%%%% In this code, four 'Distribution', 'Error', 'Control' and 'Population of neuron phases'
%%%% diagrams are set and plotted to evaluate the simulation results.

function Output_plots(handles,peak,durT,x,phi,phif,sim_time,u,L2,cos_thetas,sin_thetas,cos_th,sin_th)

u_max=str2double(get(handles.Edit_Umax,'string'));
u_min=str2double(get(handles.Edit_Umin,'string'));

plot(handles.axes_distribution, x,phi,'k',x,phif,'r','LineWidth',1);
xlabel(handles.axes_distribution,'\theta');
ylabel(handles.axes_distribution,'\rho(\theta,t)');
set(handles.axes_distribution,'XLim',[0 2*pi]);
set(handles.axes_distribution,'YLim',[0 peak]);
set(handles.axes_distribution,'xtick',[0 0.4*pi 0.8*pi 1.2*pi 1.6*pi 2*pi]);
set(handles.axes_distribution,'xticklabel',{'0','0.4\pi','0.8\pi','1.2\pi','1.6\pi','2\pi'});

set(get(handles.axes_distribution, 'title'), 'string', 'probability phase distribution')

plot(handles.axes_Control,sim_time,u,'LineWidth',1)
xlabel(handles.axes_Control,'t');
ylabel(handles.axes_Control,'u(t)');
set(handles.axes_Control,'XLim',[0 durT]);
set(handles.axes_Control,'YLim',[u_min u_max]);
set(get(handles.axes_Control, 'title'), 'string', 'Control input')

semilogy(handles.axes_error,sim_time,L2,'LineWidth',1);
xlabel(handles.axes_error,'t');
ylabel(handles.axes_error,'Error');
set(handles.axes_error,'XLim',[0 durT]);
set(handles.axes_error,'YLim',[0.001 1]);
set(get(handles.axes_error, 'title'), 'string', 'Error')


plot(handles.axes_Dsynch,cos_thetas,sin_thetas,'k o',cos_th,sin_th,'LineWidth',1.5);
set(get(handles.axes_Dsynch, 'title'), 'string', 'Phase oscillators')
axes(handles.axes_Dsynch);
axis off;
pause(0.05)