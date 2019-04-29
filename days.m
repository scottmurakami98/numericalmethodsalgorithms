function nd = days(mo, da, leap)
mo=input('What month is it?');
da=input('What day of the month is it?');
leap=input('Is it a leap year? (1 or 0)');
nd=0;


if [mo==1]
    nd=(mo+da+leap);
elseif [mo==2]
    nd=(31+da+leap);
elseif [mo==3]
    nd=(59+da+leap);
elseif [mo==4]
    nd=(90+da+leap);
elseif [mo==5]
    nd=(120+da+leap);
elseif [mo==6]
    nd=(151+da+leap);
elseif [mo==7]
    nd=(181+da+leap);
elseif [mo==8]
    nd=(212+da+leap);
elseif [mo==9]
    nd=(243+da+leap);
elseif [mo==10]
    nd=(273+da+leap);
elseif [mo==11]
    nd=(304+da+leap);
elseif [mo==12]
    nd=(334+da+leap);
else
    nd=(0);
end

fprintf('Days that have passed: \n%.0f\n',nd)