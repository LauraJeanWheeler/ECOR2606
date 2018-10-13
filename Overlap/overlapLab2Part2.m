% Part A:
R1 = 100;
R2 = 50;
f = @(D) overlap(100, 50, D); 

figure (1);
fplot(f,[50 160]);
grid on; 
ylabel 'Overalp Area in mm';
xlabel 'Distance in mm';
title 'Distance Overlap Area';

figure(2);
M = linspace(50,160,100);
Y = zeros(1,length(M));
for i=1: length(M)
Y(i) = overlap(R1,R2,M(i));
end
plot(M,Y);
grid on; 
ylabel 'Overalp Area in mm';
xlabel 'Distance in mm';
title 'Distance Overlap Area';

% Part B:
froot = @(D) overlap(100,50,D) - 2000;
r = fzero(froot,[110 120]);
fprintf('The output value that gives an overlap area of 2000 mm^2 is %f\n',r);

% Part C: 
fprintf('Distance  -  Overlap Area\n');
for i = 1: length(M)
Y(i) = overlap(R1,R2,M(i));
fprintf('%.1f  -  %.5f\n',M,Y); 
end

% Part 3 (bonus): 

