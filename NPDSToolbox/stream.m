%%% 2D  STREAM FOR SYSTEM OF FIRST ORDER ODES
% NPDSToolbox version 1.0.0
%   stream(func,y1val,y2val,t) plots the stream for the system of
%   two first order ODEs given by func, using the grid of y1 and
%   y2 values given by the vectors y1val and y2val.
%   By default, t=0 is used in func. value of variable t can be specified as an
%       additional argument: varargin  if nargin = 5 there is no varargin.
%       This means that the input arguments belong to the 'FitzHugh-Nagumo' model
%       else additional arguments related to the selected and active dimensions
%       for other three models to be displayed in the portraite axes.


% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function stream(H,func,y1val,y2val,t,varargin)
n1=length(y1val);
n2=length(y2val);
yp1=zeros(n2,n1);
yp2=zeros(n2,n1);
if nargin==5
    for i=1:n1
        for j=1:n2
            ypv = feval(func,t,[y1val(i);y2val(j)]);
            yp1(j,i) = ypv(1);
            yp2(j,i) = ypv(2);
        end
    end
else
    tag=varargin{1};y0_idx=varargin{2};y0_Nidx=varargin{3};y0=varargin{4};
    if tag==1
        temp=zeros(4,1);
        temp(y0_Nidx)=y0;
        for i=1:n1
            for j=1:n2
                temp(y0_idx)=[y1val(i);y2val(j)];
                ypv = feval(func,t,temp);
                yp1(j,i) = ypv(y0_idx(1));
                yp2(j,i) = ypv(y0_idx(2));
            end
        end
    else
        temp=zeros(3,1);
        temp(y0_Nidx)=y0;
        for i=1:n1
            for j=1:n2
                temp(y0_idx)=[y1val(i);y2val(j)];
                ypv = feval(func,t,temp);
                yp1(j,i) = ypv(y0_idx(1));
                yp2(j,i) = ypv(y0_idx(2));
            end
        end
    end
end
[sx,sy] = meshgrid(y1val,y2val);
q=streamline(H,stream2(y1val,y2val,yp1,yp2,sx,sy));
set(q, 'Color',[0.6,0.6,0.6,0.3]);
axis tight;
