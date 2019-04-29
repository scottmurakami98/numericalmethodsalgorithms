% Dishes
% APT 734D
% Code determines if the dishes should be done, and how they should be done
% 1 = Affirm
% 0 = Refute

d = input('Did you just create a dirty dish?');

if d==0
    display('Then do not worry about it.')
elseif d==1
    s = input('Does it need to be soaked?');
    dw = input('Should it go in the dishwasher?');
    if s==0 && dw==0
        display('Then clean it.')
    elseif s==1 && dw==0
        display('Then soak it, then wash it in a reasonable time frame.')
    elseif s==0 && dw==1
        display('Then put it in the dishwasher.')
    elseif s==1 && dw==1
        display('Then soak it, then put it in the dishwasher.')
    end

end


