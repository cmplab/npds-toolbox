% DYNAMIC REPORT
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% varargin   extra arguments for report

% In this code, We set the appropriate reports in a specific format for
% displaying
% Example : Report(handles, Result matrix, step, CPU time)
% Result matrix is sent to function Dynamic_State to detect chart mode

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function  Report(handles,varargin)
contents = get(handles.Popup_Neuron,'String');
val = contents{get(handles.Popup_Neuron,'Value')};
if nargin==4
    matrix_state=varargin{1};deltat=varargin{2};time=varargin{3};
    state=Dynamic_State(matrix_state(:,1),deltat);
    report="Neuron type: "+val+"   State: "+state+"     CPU time: "+num2str(time)+' second';
else
    report="Neuron type: "+val;
end
set(handles.Text_Analyse,'string',report);


%  Function for detecting system dynamic state
%  In this code, according to the result matrix,
%  a mode is detected for it from 'Periodic', 'Semi-Periodic' or
%  'Non-Periodic'.

function state = Dynamic_State(array,t)
temp1=(max(array)+array(1))/2;
temp2=(array>temp1)+-1*(array<temp1);
temp1=(max(-array)+-array(1))/2;
temp3=(-array>temp1)+-1*(-array<temp1);
temp4=find(movsum(temp2,2)==0);
temp5=find(movsum(temp3,2)==0);
time23=(t(end)-t(1))*2/3;
temp2=size(temp4);
temp3=size(temp5);
tup=t(temp4(end))-t(temp4(1));
tdown=t(temp5(end))-t(temp5(1));
if temp2(1)>2&&tup>time23||temp3(1)>2&&tdown>time23
    state='Periodic';
elseif temp2(1)>2&&tup<time23||temp3(1)>2&&tdown<time23
    state='Semi-Periodic';
else
    state='Non-Periodic';
end