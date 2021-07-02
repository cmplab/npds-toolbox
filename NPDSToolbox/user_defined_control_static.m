function u=user_defined_control(varargin)
if nargin ==9
    domain=varargin{1};phi=varargin{2};phi_f=varargin{3};
    prc=varargin{4};dprc=varargin{5};error=varargin{6};
    omega=varargin{7};iteration_number=varargin{8};delta_t=varargin{9};
elseif nargin == 12
    domain=varargin{1};prc=varargin{2};dprc=varargin{3};
    omega=varargin{4};iteration_number=varargin{5};delta_t=varargin{6};
    bk=varargin{7};bfk=varargin{8};ak=varargin{9};
    afk=varargin{10};Ika=varargin{11};Ikb=varargin{12};
elseif nargin == 13
    domain=varargin{1};phi=varargin{2};phi_f=varargin{3};
    prc=varargin{4};dprc=varargin{5};error=varargin{6};
    omega=varargin{7};iteration_number=varargin{8};delta_t=varargin{9};
    B=varargin{10};dphi=varargin{11};dphi_f=varargin{12};intensity=varargin{13};
elseif nargin == 15
    domain=varargin{1};prc=varargin{2};dprc=varargin{3};
    omega=varargin{4};iteration_number=varargin{5};delta_t=varargin{6};
    B=varargin{7};intensity=varargin{8};bk=varargin{9};
    bfk=varargin{10};ak=varargin{11};afk=varargin{12};
    Ika=varargin{13};Ikb=varargin{14};k=varargin{15};
end
u=0;
%Fixed_Control_Comment
%SPECIFIED_CONTROL