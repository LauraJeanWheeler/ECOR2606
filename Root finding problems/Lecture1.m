% Room length finding problem:A room is 4m longer than it is wide. 
% The area of the room is 20m2 What is the width of the room? 

a = 1;
b = 4;
c = -20;
disc = b^2 - 4 * a * c;

x1 = (-b + sqrt(disc))/ 2 * a;
%%fprintf('The length of the room is %f\n',x1);

% It would also be possible to use the function roots - column vector 
x2 = roots([ a b c]);

% Once could also use fzero 
f = @(x) x^2 + 4*x - 20;
x3 = fzero(f,2);
%%fprintf('%f\n',x3);

% plotting room vs width 
figure(1); 
width = linspace(0,10,50);
area = width .* (width + 4);
plot (width,area);
xlabel ('Room width (square meteres)');
ylabel ('Room area (square meteres)');
grid on;
title('Figure 1');

% Plotting to find the roots 

f2 = @(x) a*x.^2 + b*x + c; 
% redefine using dot version of exponentiation 

figure(2);
x = linspace(-10,10,50);
y = f2(x);
plot(x,y);  
xlabel ('x (metres)');
ylabel ('f(x) (square metres)');
grid on; 

% Problem #2: A 50mm diameter cork ball (specific gravity = ? = 0.25) 
% is floating in water. How deep will the ball float?

D = 50;
r = D/2;
rho = 0.25; 
fball = @(x) x.^3 - 3*r*x.^2 + 4*r^3*rho;
depth = fzero(fball,[0 D]);
fprintf('The depth is %f\n',depth);

% Could also do it a diffent way to find roots 
p = [ 1 (-3 * r) 0 (4 * r ^3 * rho)];
ballroot = roots(p);
fprintf('%f\n',ballroot);

% 1st way to plot this function:

figure (3);
fplot (fball, [-D (2 * D)]); 
grid on;

% Or you could do it like this 

figure(4);
x = linspace (-D, 2 * D, 50);
y =  polyval (p, x);
plot (x,y);
grid on;






