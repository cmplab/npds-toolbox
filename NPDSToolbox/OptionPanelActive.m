% MAKES SLIDERS AND EDITBOXES ENABLE OR DISABLE
% NPDSToolbox version 1.0.0
% handles    Structure with handles and user data (see GUIDATA)
% flag       States for (en/dis)abling sliders and editboxes

%       This code disables sliders and editboxes related
%       sliders when activating the option panel to
%       prevent errors.

%-----flag modes-----
%       flag = 'on'     enables sliders and editboxes
%       flag = 'off'    disables sliders and editboxes
%--------------------

% For information about the parameters of the models
%, refer to the parameters guide (PARAMETER_GUIDE.md)

function OptionPanelActive(handles,flag)
set(handles.Edit_exter_current,'Enable',flag);
set(handles.Slider_exter_current,'Enable',flag);
set(handles.Editnitcond1,'Enable',flag);
set(handles.Slider_initcond1,'Enable',flag);
set(handles.Editnitcond2,'Enable',flag);
set(handles.Slider_initcond2,'Enable',flag);
set(handles.Editnitcond3,'Enable',flag);
set(handles.Slider_initcond3,'Enable',flag);
set(handles.Editnitcond4,'Enable',flag);
set(handles.Slider_initcond4,'Enable',flag);