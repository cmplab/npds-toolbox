%%% RADIAL BASIS FUNCTION DISTANCE MATRIX
% NPDSToolbox version 1.0.0
% ds		Vector of domain
% dom       Values of centers
% differ	A negligible value

%---- Outputs -----
% DM		Final distance matrix

% In this code, the distance matrix is designed to
% interpolated the unknown function via the RBF method.
% For more information, see the following references
%---------------Reference---------------
%	1		Fasshauer, Gregory E. Meshfree approximation
%		    methods with MATLAB. World Scientific, 2007.
%
%	2		LIu, Gui-Rong; Gu, Yuan-Tong. An introduction
%		    to meshfree methods and their programming.
%			Springer Science & Business Media, 2005.
%---------------------------------------


function [DM] = DistanceMatrix(ds,cnt,differ)
[M,s] = size(ds); [N,s]=size(cnt);
DM= zeros(M,N);
for d=1:s
    [dr,cc]=ndgrid(ds(:,d),cnt(:,d));
    DM=DM+(dr-cc-differ).^2;
end;
DM=sqrt(DM);

