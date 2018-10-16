function [root] = FalsePositionMethood(f,a,b,N,Estep,Eactual)
% Function uses false position methood 



% Check that that neither end-point is a root

if ( f(a) == 0 )
   root = a; 
   return; 
end
if ( f(b) == 0 )
   root = b; 
   return; 
end 

% If f(a) and f(b) have the same sign, throw an exception.

if ( f(a) * f(b) > 0 ) 
 fprintf('f(a) and f(b) cannot have the same sign');
end 

% We will iterate N times and if a root was not
% found after N iterations, an exception will be thrown.

c_old = Inf;

for k = 1: N
   % Find the false position
   c = (a*f(b) + b*f(a))/(f(b) - f(a));

   % Check if we found a root or whether or not
   % we should continue with:
   %          [a, c] if f(a) and f(c) have opposite signs, or
   %          [c, b] if f(c) and f(b) have opposite signs.

   if ( f(c) == 0)
    root = c;
    return;  
   end
   if ( f(c)*f(a) < 0 )
    b = c;
   else 
    a = c;
   end 

        if ( abs( c - c_old ) < Estep )
            if ( abs( f(a) ) < abs( f(b) ) && abs( f(a) ) < Eactual )
                r = a;
                return;
            elseif ( abs( f(b) ) < Eactual )
                r = b;
                return;
            end
        end

	c_old = c;
    end

    error( 'the method did not converge' );


end

