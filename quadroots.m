% quadroots: Quadratic Solver
% Created Nov. 5 2018
% By: Scott Murakami
% The real roots of the quadratic equation ax^2+bx+c=0 are calculated using
% the inputs of a, b, and c

a=input('Enter a: ');
b=input('Enter b: ');
c=input('Enter c: ');

d=(b^2)-4*a*c;

if d < 0
    disp('This function does not have any roots.')
    
elseif d > 0
    r1 = (b+((b^2)-4*a*c)^(1/2))/(2*a);
    r2 = (b-((b^2)-4*a*c)^(1/2))/(2*a);
    fprintf('This function has two roots: \n%0.3f,%0.3f\n',r1,r2)
    
else
    r3 = b/(2*a);
    fprintf('This function has one root: \n%0.3f\n',r3)

end