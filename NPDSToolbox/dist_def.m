%%% DESIGN INITIAL AND FINAL DISTRIBUTIONS
% NPDSToolbox version 1.0.0
% dist_model		Different distribution models (Von-mises/ Uniform/ User-defined)
% location			The measure of location for Von-Mises distribution (the distribution is clustered around location)
% concentration		The measure of concentration for Von-Mises distribution
% omega				Periodic orbit value
% i      		    Current time step
% dt        		Time step value
% domain  		    Spatial domain points (between 0 and 2*pi)

%---- Outputs -----
% dist     			Distribution values (As a vector)
% diff_dist			Derivative values of distribution (As a vector)

% This code considers three different modes for designing initial and final distributions.
% 'Von-Mises' and 'Uniform' distribution modes that can be set by the user, and 'User-defined'
% distribution modes that open the functions (user_defined_initial_dist(..) for initial distribution/
% user_defined_final_dist(..) for final distribution) to get the desired distribution frpm the user.

% For more information about distributions, see their Wikipedia links
% Link 1 : https://en.wikipedia.org/wiki/Von_Mises_distribution (Von-Mises)
% Link 2 : https://en.wikipedia.org/wiki/Continuous_uniform_distribution (Uniform)

function [dist,diff_dist]=dist_def(dist_model,location,concentration,omega,i,dt,domain)
if strcmp(dist_model,'Von-Mises')
    dist=(exp(concentration*cos(domain-location-omega*i*dt))/(2*pi*besseli(0,concentration)));
    diff_dist=(-concentration*sin(domain-location-omega*i*dt).*exp(concentration*cos(domain-location-omega*i*dt)))/(2*pi*besseli(0,concentration));
elseif strcmp(dist_model,'Uniform')
    dist=1/(2*pi)*ones(size(domain));
    diff_dist=zeros(size(domain));
elseif strcmp(dist_model,'User-defined_initial')
    [dist,diff_dist]=user_defined_initial_dist(domain,location,concentration,omega,i,dt);
elseif strcmp(dist_model,'User-defined_final')
    [dist,diff_dist]=user_defined_final_dist(domain,location,concentration,omega,i,dt);
end
