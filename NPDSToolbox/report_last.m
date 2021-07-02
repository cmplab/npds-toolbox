%%% CONTROLS FINAL REPORT
% NPDSToolbox version 1.0.0
% H          Structure with handles and user data (see GUIDATA)
% domain      Spatial domain points (between 0 and 2*pi)
% u			 Vlaues of control function
% L2         The error calculated between the current distribution and the final distribution
% thetas     Phase of uncoupled neurons
% phi        Distribution values (As a vector)
% iter    	 Discrete simulation time

% In this code, We set the appropriate report in a specific format to display

function report_last(H,domain,u,L2,thetas,phi,iter)
length=size(domain);
words=get(H,'string');
words=words+"\n"+"L_2 error :"+L2(iter)+"\n"+"Energy :"...
    +trapz(domain,u(length(1):length(2)).^2)+"\n"+"Intial distribution variance :"...
    + var(phi(1,:))+"\n"+"final distribution variance :"...
    + var(phi(end,:))+"\n"+"Intial population variance :"+var(thetas(1,:))+...
    "\n"+"final population variance :"+var(thetas(iter,:));
words=compose(words);
set(H,'string',words);