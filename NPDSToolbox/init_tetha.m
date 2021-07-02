%%%  INITIAL PHASES OF NEURONS IN POPULATION BASED ON A SPECIFIC DISTRIBUTION
% NPDSToolbox version 1.0.0
%	population		Number of neurons
% 	phi				Probability distribution of neurons
%	N				Distribution vector dimension
%	domain			Spatial domain points (between 0 and 2*pi)

%---- Outputs -----
%	temp4			The initial spike phases of the neuron population

% In this code, a prototype of the phase scattering of neurons is simulated based on a specific distribution

function [temp4]=init_tetha(population,phi,N,domain)
temp1=sum(phi(1,:));
temp2=phi(1,:)/temp1;
temp3=zeros(N,1);
temp4=zeros(population,1);
temp3(1)=temp2(1);
for i=2:N
    temp3(i)=temp3(i-1)+temp2(i);
end
j=rand(population,1);
for i=1:population
    [temp4(i) arg(i)]=min(abs(j(i)-temp3));
    temp4(i)=domain(arg(i));
    temp4(i)=temp4(i)+(rand(1,1)*0.02-0.01);
end