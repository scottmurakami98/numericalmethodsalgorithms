fxl=(func(xl));
fxu=(func(xu));
b1= sign(fxl);
b2= sign(fxu);
bracket = b1+b2;
if bracket ~= 0
    
    elseif trial > 0
        xl = xr;
    else
        ea = 0;
        
        
        % Variables in order to determine the validity of the user's bracket value.
s1=sign(func(xl));  % The sign of the lower bound.
s2=sign(func(xu));  % The sign of the upper bound.
if (s1+s2) ~= 0;    % If the user has bracketed the root correctly, the sum of the signs (1, -1) should == 0. 
    error('The user has input an invalid bracket. The bracket must contain a sign change in order to find the root.'),
end

% Variables in order to determine the validity of the user's bracket value.
s1=sign(func(xl));  % The sign of the lower bound.
s2=sign(func(xu));  % The sign of the upper bound.
if (s1+s2) ~= 0;    % If the user has bracketed the root correctly, the sum of the signs (1, -1) should == 0. 
    error('The user has input an invalid bracket. The bracket must contain a sign change in order to find the root.'),
end