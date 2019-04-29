n=0;
initial=100; %principal value
v=2; %multiplier of initial value (ex: double of i = 2)
i=(initial*v);
r=0.055; %interest rate in decimal form
m=12; %number of times compounded annually (annual compound m=1)
while initial <= (i)
    initial=initial+(initial*(r/m));
    n=n+1;
end

fprintf('timescompounded: %f\n', n)
fprintf('# of years compounded %f\n',(n/12))