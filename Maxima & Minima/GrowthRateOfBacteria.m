
gval = 0.25;
% given G find c
g = @(c) (2*c)/(4+ 0.8*c + c*c + 0.2*c^3);

gcval = @(c) (2*c)/(4+ 0.8*c + c*c + 0.2*c^3) - 0.25;
%groot = fzero(gcval,[0.5 1.5]);


%fplot(g,[0 8]);

t = linspace(0,8,50);
h = Q2bacteria(t);
plot (t, h);

%t = linspace(0,8,50);
%h = ones(size(t));
%for k = 1 : length(t)
     %h(k) = Q2bacteria(t(k)); 
%end
%plot (t, h);

grid on; 
xlabel ('time');
ylabel 'growth rate';

% When does growth rate reach a maximum?
gmin = @(c) -((2*c)/(4+ 0.8*c + c*c + 0.2*c^3));
ggmin = fminbnd(gmin,0.5, 3)

f=@(x) 2+x(1)-x(2)+2*x(1)^2+2*x(1)*x(2)+x(2)^2 ;
[x,y] = fminsearch(f, [-0.5, 0.5])