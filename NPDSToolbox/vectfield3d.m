%%% 3D VECTOR FIELD FOR SYSTEM OF FIRST ORDER ODES
% NPDSToolbox version 1.0.0
%       vectfield3d(func,y1val,y2val,y3val,t) plots the vector field for the system of
%       first order ODEs given by func, using the grid of y1 ,
%       y2 and y3 values given by the vectors y1val, y2val, y3val.
%       By default, t=0 is used in func. Value of variable t can be specified as an
%       additional argument: varargin  if nargin = 9 there is no varargin
%       , This means that the input arguments belong to the 'FitzHugh-Nagumo' model
%       else additional arguments related to the selected and active dimensions
%       for other three models to be displayed in the portraite axes.


% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)


function vectfield3d(H,func,y1val,y2val,y3val,t,varargin)
n1=length(y1val);
n2=length(y2val);
n3=length(y3val);
yp1=zeros(n2,n1);
yp2=zeros(n2,n1);
yp3=zeros(n3,n1);
if nargin==9
    y0_idx=varargin{1};y0_Nidx=varargin{2};y0=varargin{3};
    temp=zeros(4,1);
    temp(y0_Nidx)=y0;
    for i=1:n1
        for j=1:n2
            for k=1:n3
                temp(y0_idx)=[y1val(i);y2val(j);y3val(k)];
                ypv = feval(func,t,temp);
                yp1(i,j,k) = ypv(y0_idx(1));
                yp2(i,j,k) = ypv(y0_idx(2));
                yp3(i,j,k) = ypv(y0_idx(3));
            end
        end
    end
    
else
    y0_idx=varargin{1};
    temp=zeros(3,1);
    for i=1:n1
        for j=1:n2
            for k=1:n3
                temp(y0_idx)=[y1val(i);y2val(j);y3val(k)];
                ypv = feval(func,t,temp);
                yp1(i,j,k) = ypv(y0_idx(1));
                yp2(i,j,k) = ypv(y0_idx(2));
                yp3(i,j,k) = ypv(y0_idx(3));
            end
        end
    end
end
[Y1val,Y2val,Y3val]=meshgrid(y1val,y2val,y3val);
q=quiver3(H,Y1val,Y2val,Y3val,yp1,yp2,yp3,'b','LineWidth',1,'MaxHeadSize',5,'AutoScale','on');
axis tight;
q.ShowArrowHead = 'on';
set(q, 'Color',[0.6 0.6 0.6]);
set(H,'xlim',[y1val(1) y1val(end)]);
set(H,'ylim',[y2val(1) y2val(end)]);
set(H,'zlim',[y3val(1) y3val(end)]);


