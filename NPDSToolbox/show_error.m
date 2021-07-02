%%%DISPLAY THE APPROPRIATE ERROR MESSAGE
% NPDSToolbox version 1.0.0
%	show_error(error_number)
%	error_number	Error type

% -----NUMBER TYPE-----
%		1- error_number = 1	 Displays error related to empty edit box
%		2- error_number = 2	 Displays error related to invalid edit box value (character)
%		3- error_number = 3	 Displays error related to invalid edit box value (out of range)
%		4- error_number = 4	 Displays error related to invalid edit box value (lower bound >= upper bound)
%		5- error_number = 5	 Displays error related to invalid edit box value (upper bound <= lower bound)
%		6- error_number = 6	 Displays error related to invalid edit box value (final time)
%		7- error_number = 7	 Displays error related to invalid edit box value (positive input)
%-----------------------

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function show_error(error_number)
opts = struct('WindowStyle','modal','Interpreter','tex');
if error_number==1
    [icondata,iconcmap] = imread('IconN.jpg');
    MSG=msgbox('\fontsize{10}  Insert an input','Input Error','custom',icondata,iconcmap,opts);
elseif error_number==2
    [icondata,iconcmap] = imread('IconC.jpg');
    MSG=msgbox('\fontsize{10} Input must be numeric','Input Error','custom',icondata,iconcmap,opts);
elseif error_number==3
    [icondata,iconcmap] = imread('IconO.jpg');
    MSG=msgbox('\fontsize{10} Input is out of range','Range Error','custom',icondata,iconcmap,opts);
elseif error_number==4
    [icondata,iconcmap] = imread('IconS.jpg');
    MSG=msgbox('\fontsize{10} The lower bound is greater (or equal) than the upper one','Bound Error','custom',icondata,iconcmap,opts);
elseif error_number==5
    [icondata,iconcmap] = imread('IconG.jpg');
    MSG=msgbox('\fontsize{10} The upper bound is smaller (or equal) than the lower one','Bound Error','custom',icondata,iconcmap,opts);
elseif error_number==6
    [icondata,iconcmap] = imread('IconT.jpg');
    MSG=msgbox('\fontsize{10} The final time must be positive (>0)','Time Error','custom',icondata,iconcmap,opts);
elseif error_number==7
    [icondata,iconcmap] = imread('IconT.jpg');
    MSG=msgbox('\fontsize{10} Input cannot be negative','Input Error','custom',icondata,iconcmap,opts);
end
set(MSG,'color',[1 1 1]);