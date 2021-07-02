%%% DEFINES WENDLAND FUNCTIONS AND THEIR DERIVATIVES FOR INTERPOLATION
%  eps		Local support domain parameter value
%  differ	A negligible value
%  type		Type of wendland function (C2/C4/C6)
%  r		Distance matrix
%  x		domain nodes x
%  y        domain nodes y

%----OUTPUT-----
% X			Interpolation matrix
% DX   		The first derivative interpolation matrix in terms of x
% DY   		The first derivative interpolation matrix in terms of Y
% DDX   	The second derivative interpolation matrix in terms of x
% DDY   	The second derivative interpolation matrix in terms of y
% DXY   	The second mix derivative interpolation matrix in terms of x and y


% For more information, see following references
%----------------Reference---------------
%	1		FASSHAUER, Gregory E. Meshfree approximation
%		    methods with MATLAB. World Scientific, 2007.
%
%	2		LIU, Gui-Rong; GU, Yuan-Tong. An introduction
%		    to meshfree methods and their programming.
%			Springer Science & Business Media, 2005.
%
%   3		WENDLAND, Holger. Scattered data approximation.
%		    Cambridge university press, 2004.
%
%   4		WENDLAND, Holger. Piecewise polynomial, positive
%		    definite and compactly supported radial functions
%			of minimal degree. Advances in computational Mathematics,
%          1995, 4.1: 389-396.
%----------------------------------------

function [X,DX,DY,DDX,DDY,DXY] = Wendland(eps,differ,type,r,x,y)
fmax=max(0,1-eps.*r);
x_center=x'+differ;
y_center=y'-differ;
if type=='C2'
    X= fmax.^4.*(4*eps*r+1);
    DR=-20*eps^2.*r.*fmax.^3;
    DDR=(20*eps^2.*(4*eps.*r-1).*fmax.^2);
else if type == 'C4'
        X=fmax.^6.*(35*eps^2.*r.^2+18*eps.*r+3);
        DR=-56*eps^2.*r.*(5*eps.*r+1).*fmax.^5;
        DDR=56*eps^2*(35*eps^2*r.^2-4*eps.*r-1).*fmax.^4;
    else if type == 'C6'
            X=fmax.^8.*(32*eps^3*r.^3+25*eps^2*r.^2+8*eps*r+1);
            DR=-22*eps^2*r.*(16*eps^2*r.^2+7*eps*r+1).*fmax.^7;
            DDR= 22*eps^2*(160*eps^3*r.^3+15*eps^2*r.^2-6*eps*r-1).*fmax.^6;
        end
    end
end
if y==0
    norx=(x-x_center);
    DX=norx./r.*DR;
    DDX=(norx./r).^2.*DDR;
    DY=0;
    DDY=0;
    DXY=0;
else
    norx=(x-x_center);
    nory=(y-y_center);
    DX=norx./r.*DR;
    DY=nory./r.*DR;
    DDX=norx.^2./r.^2.*DDR+nory.^2./r.^3.*DR;
    DDY=nory.^2./r.^2.*DDR+norx.^2./r.^3.*DR;
    DXY=norx.*nory./r.^2.*DDR-norx.*nory./r.^3.*DR;
end
