function [area] = OVERLAP(R1,R2,D)
% OVERLAP:The function will calulate the overlap area of two circles using
%        the radius of both circles & the distance between the centeres.
 
% Inputs:
% R1 = radius of the first circle  in mm.
% R2 = radius of the second circle in mm. 
% D = distance between the centeres of the circles in mm. 
% Output:
% area = overlapped area in mm^2. 

% Laura Wheeler - 101087270

% Case 1: The inputs are not valid.
if(R1<=0)||(R2<=0)||(D<0)
   if(R1>0) 
       disp ('R1 is a valid input') 
   elseif(R2>0) 
       disp ('R2 is a valid input') 
   elseif(D>=0) 
       disp ('D is a valid input')
   end 
   error('Inputs are invalid')
end

% Case 2: The Inputs are all valid, and the circles do not overlap.
if(D>=(R1+R2))
   area = 0;
   return
end

% Case 3: The inputs are all valid, and one circle is fully inside the other.
if(D<(abs(R1-R2)))
   area = pi*(min(R1,R2))^2;
   return 
end

% Case 4: The inputs are all valid, and the circles partially overlap.
x1 = ((D^2) + (R1^2) - (R2^2))/(2*D);
x2 = D - x1;
A1 = @(x1,R1) ((pi*R1^2)/2) - ((x1*(R1^2 - x1^2)^(0.5)) + ((R1^2)*asin(x1/R1)));
A2 = @(x2,R2) ((pi*R2^2)/2) - ((x2*(R2^2 - x2^2)^(0.5)) + ((R2^2)*asin(x2/R2)));
area = A1(x1,R1) + A2(x2,R2);

end

