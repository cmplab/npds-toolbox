%CHECK INPUTS IN NEURAL DYNAMIC PART TO DETECT POSSIBLE ERRORS
% NPDSToolbox version 1.0.0
% 	Check_inputs(hObject,type,varargin)
%   hObject			handle to Edit boxes (see GCBO)
%   type			Check the number of edit boxes to find the type of error
%   varargin        Additional arguments depending on the type of error checking

% -----ERROR CHECKING TYPES-----
%		1- type = 'Bounded'  Checks that the value entered in the edit box is not
%							 outside of the defined range, returns error number 3
%							(see show_error(..)). Based on this type of error check,
%							 two additional arguments, which are the upper and lower
%							 boundaries of the range, are passed to the function as varargin arguments.
%							 Check_inputs(Editbox1,'Bounded',Editbox2,Editbox3)
%		2- type = 'General'	 In this case, the text color of the text in the edit box turns to red.
%							 Check_inputs(Editbox1,'General')
%		3- type = 'Lbounded' Checks that the lower bound is not larger than the upper bound.
%							 If an error occurs then the function returns error number 4
%                            (see show_error(..)). Based on this
%						     type of error check,one additional arguments, which is the upper
%							 bound of the range, is passed to the function as varargin arguments.
%							 Check_inputs(Editbox1,'Lbounded',Editbox2)
%		4- type = 'Ubounded' Checks that the upper bound is not smallerthan the lower bound.
%							 If an error occurs then the function returns error 5 error 
%                            (see show_error(..)). Based on this
%						     type of error check,one additional arguments, which is the lower
%							 bound of the range, is passed to the function as varargin arguments.
%							 Check_inputs(Editbox1,'Ubounded',Editbox2)
%		5- type = 'String'   Checks that the value inside the edit box is numeric (not empty and
%							 not character). If an error occurs then the function returns error number 1 or 2 
%                            error (see show_error(..)).
%							 Check_inputs(Editbox1,'String')
%		6- type = 'Time'	 Checks that the final time value is valid (positive). If an error occurs then 
%                            the function returns returns error number 3 (see show_error(..)).
%							 Check_inputs(Editbox1,'Time')
%-------------------------------


function error_number=Check_inputs(hObject,type,varargin)
error_number=0;
if (strcmp(type,'General') && isempty(varargin))
    set(hObject,'Foregroundcolor','k');
end
str=get(hObject,'String');
if isempty(str)
    error_number=1;
    set(hObject,'Foregroundcolor','r');
elseif isempty( str2double( str ) )
    error_number=2;
    set(hObject,'Foregroundcolor','r');
end

if strcmp(type,'Bounded')
    if (str2double(str)<=str2double(get(varargin{1},'string')) || str2double(str)>=str2double(get(varargin{2},'string')))
        error_number=3;
        set(hObject,'Foregroundcolor','r');
    end
elseif strcmp(type,'Lbounded')
    if str2double(str)>=str2double(get(varargin{1},'string'))
        error_number=4;
        set(hObject,'Foregroundcolor','r');
    end
elseif strcmp(type,'Ubounded')
    if str2double(str)<=str2double(get(varargin{1},'string'))
        error_number=5;
        set(hObject,'Foregroundcolor','r');
    end
elseif strcmp(type,'Time')
    if str2double(str)<=0
        error_number=6;
        set(hObject,'Foregroundcolor','r');
    end
end




