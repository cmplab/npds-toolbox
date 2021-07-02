%%% RUNS NUMERICAL ALGORITHMS FOR SOLVING CONTROL MODEL
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% flag		 (On/Off) Showing plots


%----- Outputs -----
% Dist 		  Current distibution
% Error		  The error calculated between the current distribution and the final distribution in the past time steps
% Thetas      uncoupled neurons phases
% U			  Vlaue of control function
% sim_time    Discrete simulation time
% Domain	  Spatial domain points (between 0 and 2*pi)


%In this code, based on the user's choice, one of the numerical methods is
%employed to solve the control model.

function [Dist,Error,Thetas,U,Sim_time,Domain]=Run_test(handles,flag)
contents = get(handles.Popup_Method,'String');
val = contents{get(handles.Popup_Method,'Value')};

if get(handles.checkbox_Noise,'Value')
    if strcmp(val,'FD')
        [Dist,Error,Thetas,U,Sim_time,Domain]= noisy_decoupled_FD(handles,200,flag);
    elseif strcmp(val,'RBF-FD')
        [Dist,Error,Thetas,U,Sim_time,Domain]= noisy_decoupled_RBFFD(handles,200,flag);
    elseif strcmp(val,'RBF')
        [Dist,Error,Thetas,U,Sim_time,Domain]= noisy_decoupled_RBF(handles,200,flag);
    elseif strcmp(val,'Spectral')
        [Dist,Error,Thetas,U,Sim_time,Domain]= noisy_decoupled_spectral(handles,200,flag);
    elseif strcmp(val,'Fourier')
        [Dist,Error,Thetas,U,Sim_time,Domain]= noisy_decoupled_Fourier(handles,2^7,flag);
    else
    end
else
    if strcmp(val,'FD')
        [Dist,Error,Thetas,U,Sim_time,Domain]= decoupled_FD(handles,200,flag);
    elseif strcmp(val,'RBF-FD')
        [Dist,Error,Thetas,U,Sim_time,Domain]= decoupled_RBFFD(handles,200,flag);
    elseif strcmp(val,'RBF')
        [Dist,Error,Thetas,U,Sim_time,Domain]= decoupled_RBF(handles,200,flag);
    elseif strcmp(val,'Spectral')
        [Dist,Error,Thetas,U,Sim_time,Domain]= decoupled_spectral(handles,200,flag);
    elseif strcmp(val,'Fourier')
        [Dist,Error,Thetas,U,Sim_time,Domain]= decoupled_Fourier(handles,2^7,flag);
    else
    end
end