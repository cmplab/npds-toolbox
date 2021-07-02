%%% REPORT OF CONTROL MODEL TYPE ((DE)SYNCHRONIZATION)
% NPDSToolbox version 1.0.0
% handles    structure with handles and user data (see GUIDATA)

function report_main(handles,location,concentration,omega,i,dt,domain)
contents = get(handles.popupm_Init_Dist,'String');
val1 = contents{get(handles.popupm_Init_Dist,'Value')};
contents = get(handles.popup_Final_Dist,'String');
val2 = contents{get(handles.popup_Final_Dist,'Value')};

if strcmp(val1,'Von-Mises')
    if strcmp(val2,'Von-Mises')
        type='Process type:Unknown';
    elseif strcmp(val2,'Uniform')
        type='Process type:Desynchronization';
    else
        Number_of_peaks=fun_peak(2,location,concentration,omega,i,dt,domain);
        if Number_of_peaks==0
            type='Process type:Desynchronization';
        elseif Number_of_peaks==1
            type='Process type:Unknown';
        else
            type='Process type:Synchronization';
        end
    end
elseif strcmp(val1,'Uniform')
    if strcmp(val2,'Von-Mises')
        type='Process type:Synchronization';
    elseif strcmp(val2,'Uniform')
        type='Process type:Unknown';
    else
        Number_of_peaks=fun_peak(2,location,concentration,omega,i,dt,domain);
        if Number_of_peaks==0
            type='Process type:Unknown';
        elseif Number_of_peaks==1
            type='Process type:Synchronization';
        else
            type='Process type:Synchronization';
        end
    end
else
    Number_of_peaks2=fun_peak(1,location,concentration,omega,i,dt,domain);
    
    
    
    if Number_of_peaks2==0
        if strcmp(val2,'Von-Mises')
            type='Process type:Synchronization';
        elseif strcmp(val2,'Uniform')
            type='Process type:Unknown';
        else
            Number_of_peaks=fun_peak(2,location,concentration,omega,i,dt,domain);
            if Number_of_peaks==0
                type='Process type:Unknown';
            elseif Number_of_peaks==1
                type='Process type:Synchronization';
            else
                type='Process type:Synchronization';
            end
        end
    elseif Number_of_peaks2==1
        if strcmp(val2,'Von-Mises')
            type='Process type:Unknown';
        elseif strcmp(val2,'Uniform')
            type='Process type:Desynchronization';
        else
            Number_of_peaks=fun_peak(2,location,concentration,omega,i,dt,domain);
            if Number_of_peaks==0
                type='Process type:Desynchronization';
            elseif Number_of_peaks==1
                type='Process type:Unknown';
            else
                type='Process type:Synchronization';
            end
        end
    else
        if strcmp(val2,'Von-Mises')
            type='Process type:Synchronization';
        elseif strcmp(val2,'Uniform')
            type='Process type:Synchronization';
        else
            Number_of_peaks=fun_peak(2,location,concentration,omega,i,dt,domain);
            if Number_of_peaks==0
                type='Process type:Desynchronization';
            elseif Number_of_peaks==1
                type='Process type:Unknown';
            else
                type='Process type:Unknown';
            end
        end
        
    end
    
    
    
    
    
    
end
set(handles.Text_result,'string',type);
end


%%% DISTRIBUTION TYPE IDENTIFICATION FUNCTION
% flag		flag for distribuation situation (initial/final)

function type=fun_peak(flag,location,concentration,omega,i,dt,domain)
if flag==1
    Dist=user_defined_initial_dist(domain,location,concentration,omega,i,dt);
else
    Dist=user_defined_final_dist(domain,location,concentration,omega,i,dt);
    
end
n=max(size(Dist));
cnt_peaks=0;
for i=2:n-1
    if Dist(i)>Dist(i-1) && Dist(i)>Dist(i+1)
        cnt_peaks=cnt_peaks+1;
    end
end
if cnt_peaks==0
    type=0;
elseif cnt_peaks==1
    type=1;
else
    type=2;
end
end