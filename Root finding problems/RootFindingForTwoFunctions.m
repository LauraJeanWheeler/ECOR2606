% Root finding for two functions

% Problem: Find all of the points that satisfy both y = x2-17x+60 and
% y = 50sin(x/2) (i.e. find all of the intersections of the curves defined
% by these equations).

%f1 = @(x) x.^2-17*x+60;
%f2 = @(x) 50*sin(x*0.5); 

figure (1);

x = linspace (0, 20, 100);
%y1 = f1(x);
%y2 = f2(x);


y1 = @(x) x.^2-17*x+60;
y2 = @(x) 50*sin(x*0.5);

fplot(y1,[0 20]);
hold on;
fplot(y2,[0 20]);
hold off; 

%plot (x, y1, 'r');
hold on;
%plot (x, y2, 'b');
hold off;
grid on;
xlabel('x');
ylabel('y');

% Now define the function for root finding 

froot = @(x) f1(x)-f2(x);
figure(2);
fplot(froot,[0 20]);
grid on;

%t = roots(froot);
%printf('The equations equal to zero when x is equal to %f\n',t);

x1 = fzero(froot,[0 2]);
x2 = fzero(froot,[6 8]);
x3 = fzero(froot,[12 14]);
x4 = fzero(froot,[16 17]);

fprintf('%d %d %d %d\n',x1, x2, x3, x4);


