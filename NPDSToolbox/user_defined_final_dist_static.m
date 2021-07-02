function [dist,diff_dist]=user_defined_final_dist(domain,location,concentration,omega,i,dt)
%  dist=(exp(concentration*cos(domain-location-omega*i*dt))/(2*pi*besseli(0,concentration)));
%     diff_dist=(-concentration*sin(domain-location-omega*i*dt).*exp(concentration*cos(domain-location-omega*i*dt)))/(2*pi*besseli(0,concentration));   
dist=1/(2*pi)*ones(size(domain));
diff_dist=zeros(size(domain));
%Fixed_final_distribution_Comment
%SPECIFIED_FINAL_DISTRIBUTION