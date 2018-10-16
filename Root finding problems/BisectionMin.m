function [middle] = BisectionMin(f,xL,xU,Edes)
 
% f = a one variable function 
% xL = Lower bound of the search 
% xU = upper bound of the search 
% Edes = amount of error desired, function will stop when x is within Edes

while (Edes <= (xU - xL))

    middle = (xL + xU)/2;

    if (f(middle+0.001)) < (f(middle))
        xL = middle;
    else  
        xU = middle;
    end
end

end 
