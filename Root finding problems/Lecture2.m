% Aircraft are typically equipped with a static port and a Pitot tube. 
% The static port measures the static pressure (P) of the airflow past 
% the aircraft and the Pitot tube measures the stagnation pressure (Po) 
% of this flow. If an aircraft's speed (expressed as a Mach number) is
% knownthe ratio of the two pressures (Po/P) can be computed:

% You can plot the pressure ratio for match numbers 1 to 7

%figure(1);
%fplot(@PR, [0 7]);
%xlabel ('Mach Number');
%ylabel ('Pressure Ratio');
%grid on; 
%ratio = input('Enter pressure ratio: ');

% Define function for root finding 
%f = @(M) PR(M) - ratio;
%M = fzero(f,[0 7]);
%fprintf ('The mach number is %f\n', M);

% In order to convert a vector of inputs into a vector of 
% outputs it is necessary to use a loop: 

M = 0 : 0.1 : 7;
for k = 1; length(M) % from 1 to length(M) in steps of 1
    ratio(k) = PR(M(k));
end

figure(2);
fplot(@PR, [0 7]);
xlabel ('Mach Number');
ylabel ('Pressure Ratio');
grid on; 



