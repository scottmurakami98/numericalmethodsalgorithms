function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%falsePosition.m estimates the root of a user-input function.
%
%   MECH105 // Feb-27-19 // Scott Murakami
%
% Inputs:
%   func = function input by user. Defined first as @(variable)[function],
%                                  then implemented in place of 'func'
%   xl = lower bound estimate      ex: '(@)x fx(x)'
%   xu = upper bound estimate
%   es = desired relative error (default 0.0001%)
%   maxiter = the number of iterations desired (default 200)
%
% Outputs:
%   root = the estimated root location
%   fx = the function evaluated at the root location
%   ea = the approximate relative error (%)
%   iter = how many iterations were performed
% 
%--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--~~--
format long

%Initial error check for inputs from user. Minimum of 3 (func, xl, xu).
if nargin < 3, error('A minimum of 3 input arguments are required, please address.'), end
if nargin < 4, es = 0.0001; end    % Defaults to a relative error of 0.0001 (%) if not supplied by user.
if nargin < 5, maxiter = 200; end  % Defaults to a max iteration count of 200 if not supplied by user.

% Defining base values for iter, ea, xr.
iter = 0;
ea = 100;
xr = 0;

% Variables in order to determine the validity of the user's bracket value.
s1=sign(func(xl));  % The sign of the lower bound.
s2=sign(func(xu));  % The sign of the upper bound.

if func(xl) == 0;       % If the user has chosen the root for xl. 
    xr = xl;
    fprintf('\nThe root is %d (xl) \n',xr) 
elseif func(xu) == 0;   % If the user has chosen the root for xu.
    xr = xu;
    fprintf('\nThe root is %d (xu)\n',xr)
elseif (s1+s2) ~= 0;    % If the user has bracketed the root correctly, the sum of the signs (1, -1) should == 0. 
    error('The user has input an invalid bracket. The bracket must contain a sign change in order to find the root.'),
end

% Error checking for -inf or inf values of the function at xl, xu.
if func(xl) == -inf || func(xl) == inf;
    error('Lower bound DNE'), end
if func(xu) == -inf || func(xu) == inf;
    error('Upper bound DNE'), end

while (1)
  prevxr = xr;                     % (Re)defining xr for the subsequent iteration.
    xr = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu)));  % False position formula.
    iter = iter + 1;               % Step counter for iterations.

    if xr ~= 0, ea = abs((xr-prevxr)/xr) * 100; end   % ea formula.
        
    decision = func(xl) * func(xr);          % Determining which bound xr becomes.
    if decision < 0
        xu = xr;
    else
        xl = xr;  
    end
% Function will break if/when desired error or iterations has been reached.
    if ea <= es || iter >= maxiter, break, end 
end

fprintf('\n>The root of the function = %d', xr);
fprintf('\n>The value of the function at the root = %d', func(xr));
fprintf('\n>The approximate relative error = %d', ea);
fprintf('\n>The number of iterations completed = %d\n', iter);


end

