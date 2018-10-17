% Example 4

% You buy a $25,000 piece of equipment for nothing down at $5,500 per year for 6
% years. What interest rate are you paying? 

A = 5500;
P = 25000;
n = 6;

calcA = @(i) P.*(i.* (1 +i).^n)/(((1 +i).^n)- 1 );

fplot(calcA,[0.01 0.20]);
figure(1);
xlabel('Interest rate');
ylabel('Cost');
grid on; 

% Now to define the function for root finding 

rootfinding = @(i) calcA(i)-A;
i=fzero(rootfinding,[0.08, 0.1]);
fprintf('The interest rate is equal to:%f\n',i);

% You could also make a function that does the same thing
