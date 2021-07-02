%%% APPROXIMATES CALCULATION OF PHASE RESPONCE CURVE FUNCTIONS
% NPDSToolbox version 1.0.0
%	model		PRC model name
% 	domain      Spatial domain points (between 0 and 2*pi)

%---- OUTPUT ----
%	z			PRC vector
%	zp			Derivative of PRC (As a vector)


% In this function, the approximate of PRC IS calculated to be use in the control model.
% PRCs are based on four models: Rose-Hindmarch, FitzHugh-Nagumo, Hodgkin-Huxley and Thalamic.
% 'Hodgkin-Huxley' and 'Thalamic' PRCs are interpolated by the function PRC_interpol(..).

% -----applied references for models in this code-----
%           	                BROWN, Eric; MOEHLIS, Jeff; HOLMES, Philip.
%							    On the phase reduction and response dynamics of
%							    neural oscillator populations. Neural computation,
%							    2004, 16.4: 673-715.â€?
%
%								MONGA, Bharat; MOEHLIS, Jeff.
%							    Phase distribution control of a population of
%							    oscillators, 2019,
%							    Physica D: Nonlinear Phenomena, 398: 115-129.
%
%----------------------------------------------------

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.m)


function [z,zp]=PRC_function(model,method,domain)
if strcmp(model,'Rose-Hindmarch')
    z=(1-cos(domain'))/(2*pi);
    zp=sin(domain')/(2*pi);
elseif strcmp(model,'FitzHugh-Nagumo')
    z=-43.41215711*sin(domain');
    zp=-43.41215711*cos(domain');
elseif strcmp(model,'Hodgkin-Huxley')
    [z,zp]=PRC_interpol(domain,'Hodgkin-Huxley');
elseif strcmp(model,'Thalamic')
    [z,zp]=PRC_interpol(domain,'Thalamic');
    
end