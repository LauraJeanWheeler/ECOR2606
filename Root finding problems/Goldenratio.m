function [x] = Goldenratio(f,xL, xU, Edes, display)
% Uses golden ratio to determine mima of a function 
%
% f = a one variable function 
% xL = Lower bound of the search 
% xU = upper bound of the search 
% Edes = amount of error desired, function will stop when x is within Edes
% display = stupid display option 

% Golden ratio minus 1
GRm1 = ((1 + sqrt(5))/2) - 1;

% nargin calculated the number of arguments into the function
if nargin < 5
   display = 0; 
end 

% If the person wants to display (display not 0) then it will print the
% values 
if display 
fprintf(' k\t xL\t x2\t x1\t xU\t Emax\n');
end 

% Setting the values up for an iteration
x1 = xL + GRm1*(xU - xL);
x2 = xU - GRm1*(xU - xL); 
x0 = xU - xL; 
fx1 = f(x1);
fx2 = f(x2);

for k = 1: 1000 
    Emax = (x0 * (GRm1)^(k-1))/2; 
    
    if display 
        fprintf ('%5d%12.6f%12.6f%12.6f%12.6f%12.6f\n', k, xL, x2, x1, xU, Emax);
    end 

    % If we are within the right amount of error just return x
    if Emax <= Edes 
    x = (xU + xL)/2;
    return;
    end 

    if fx2 < fx1 
    % Walls close in mwahahah
    xU = x1; 
    % Reuse old interior point
    x1 = x2; 
    fx1 = fx2; 
    % Recalculate new x2 (x1 stole the x2 value) 
    x2 = xU - GRm1*(xU-xL);
    fx2 = f(x2);
    
    else 
    % Walls close in
    xL = x2; 
    % reuse old interior point
    x2 = x1; 
    fx2 = fx1; 
    % Recalculate new x1 value 
    x1 = xL + GRm1*(xU-xL); 
    fx1 = f(x1);
    
    end
end

error ('Golden section search has not converged.');

end

