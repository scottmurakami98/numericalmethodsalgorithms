function I = Simpson(x,y)
% This function utilizes Simpson's 1/3 rule to integrate experimental data
% with an even number of intervals. If there is an odd number of intervals,
% the trapezoidal rule is applied for the last interval.
%
% Scott Murakami
% MECH105
% April 15 2019
%
% Inputs:
%   x: Array containing the x values (equally spaced)
%   y: Array containing the y values (matches x dimensions)
% Outputs:
%   I: Integral value calculated with Simpson's 1/3 rule (and trap rule
%   when applicable)
% ============================================================

if nargin ~= 2 % Check number of inputs
    error('Simpsons requires two inputs.')
end

n = length(x); % Create variables for input lengths
m = length(y);
if n ~= m % Error check for correct inputs
    error('The length of inputs X and Y must be the same.')
end

spacing = range(x(2:end) - x(1:end-1)); % Equal spaced x check
if spacing ~= 0
    error('Input array x must be equally spaced.')

i = n-1; % Creates # interval variable
check = rem(i,2); % Checks for even or odd # of intervals
h = x(end) - x(1); % Creates integration bound interval

% Even # of intervals: Simpson's 1/3 rule

if check == 0 % If there are an even # of intervals, 'check' == 0
    even = 0;
    odd = 0;
    
    for j = 3:2:i-1 % Sums even terms
        even = even + y(j);
    end
    for j = 2:2:i % Sums odd terms
        odd = odd + y(j);
    end
    
    I = (h)*((y(1)+(4*odd)+(2*even)+y(end))/(3*i)); % Simpson's 1/3 EQ
end

%% Odd # of intervals - Implements Simp 1/3 and Trapezoidal rule

if check == 1 % If odd # of intervals, check == 1. Thus, trap rule
    warning('The trapezoidal rule will be applied for an odd number of intervals.')
    odd = 0;
    even = 0;
    h_simp = (x(end-1)-x(1)); % Simpson step size
    h_trap = (x(end)-x(end-1)); % Trap step size
    
    for j = 2:2:i-1
        odd = odd + y(j);
    end
    for j = 3:2:i-2
        even = even + y(j);
    end
    
    I_simp = (h_simp)*((y(1)+(4*odd)+(2*even)+y(end-1))/(3*(n-1))); % Simp integral
    I_trap = (h_trap)*((y(end-1)+(y(end))/2)); % Trapezoidal integral
    I = I_simp + I_trap; % Complete integral (sum of Simp and trap)
end
end
