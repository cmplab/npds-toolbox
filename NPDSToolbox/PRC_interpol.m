%%% INTERPOLATS PHASE RESPONCE CURVE OF Hodgkin-Huxley and Thalamic
% NPDSToolbox version 1.0.0
% 	domReg      Spatial domain points (between 0 and 2*pi)
%	type		PRC model name

%----OUTPUT----
%	prc			PRC vector
%	dprc		Derivative of PRC (As a vector)

% In this code, Hodgkin-Huxley and Thalamic phase responce curves are calculated using pre-prepared data and RBF method.

%-------- APPLIED REFRENCES --------
%          BROWN, Eric; MOEHLIS, Jeff; HOLMES, Philip.
%		   On the phase reduction and response dynamics of
%		   neural oscillator populations. Neural computation,
%		   2004, 16.4: 673-715.â
%
%		   FASSHAUER, Gregory E. Meshfree approximation
%		   methods with MATLAB. World Scientific, 2007.

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)


function [prc,dprc] = PRC_interpol(domReg,type)
if strcmp(type,'Hodgkin-Huxley')
    load("matrices/HH.mat");
else
    load("matrices/Thalamic.mat")
end
differ=0.0000001;
LSD=1;
dom=A(:,1);
DS=DistanceMatrix(dom,dom,differ);
z=zeros(size(A,1),1);
[RBF]=Wendland(LSD,differ,'C4',DS,z,z);
a=RBF\A(:,2);
DS=DistanceMatrix(domReg',dom,differ);
[RBF]=Wendland(LSD,differ,'C4',DS,0,0);
prc=(RBF*a);
dprc=(prc(2:end)-prc(1:end-1))./(domReg(2:end)-domReg(1:end-1))';
dprc(size(domReg))=dprc(end-1);

end