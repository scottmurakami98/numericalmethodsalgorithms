%% Mech Group Project
% Written by Scott, Marcus , and Sydney Spiegel
% 11/19/2018
% The purpose of this project was to measure how an arrow's kenetic energy
% and impusle changes by being fired with diffrently weighted tips. For
% this project we used 100, 125 , and 145 grain weighted tips. With this
% information a hunter could choose an arrow that would have the largest
% kinetic energy and impulse.

% This is a bar graph of all three arrows' kinetic energy
figure;
data=xlsread('Arrow_project_data.xlsx');
KE100=data(1,15);
KE125=data(1,30);
KE145=data(1,45);
xmatrixKE=[KE100,KE125,KE145];
c=categorical({'100 grain','125 grain','145 grain'});
b=bar(c,xmatrixKE);
title('Kinetic Energy of 100, 125, and 145 Grain Field Tips')
xlabel('')
ylabel('Kinetic Energy (KE) [N*m]')
b.FaceColor = 'flat';
b.CData(1,:)=[0 0 1];
b.CData(2,:)=[1 0 0];
b.CData(3,:)=[1 1 0];
ax = gca;
ax.FontSize = 13;
grid;
hold on ;

% This is the graph of all three arrow's average velocity
figure;
AV100=data(1,9);
AV125=data(1,24);
AV145=data(1,39);
xmatrixAV=[AV100,AV125,AV145];
c=categorical({'100 grain','125 grain','145 grain'});
b=bar(c,xmatrixAV);
title('Average Velocity of 100, 125, and 145 Grain Field Tips')
xlabel('')
ylabel('Velocity (v) [m/s]')
b.FaceColor = 'flat';
b.CData(1,:)=[0 0 1];
b.CData(2,:)=[1 0 0];
b.CData(3,:)=[1 1 0];
ax = gca;
ax.FontSize = 13;
grid;
hold on ;

% This is the bar graph of each arrow's impulse  
figure;
Imp100=data(1,12);
Imp125=data(1,27);
Imp145=data(1,42);
xmatrixImp=[Imp100,Imp125,Imp145]; % create 1 by 3 matrix of impulse values for all three weights 
c=categorical({'100 grain','125 grain','145 grain'});
b=bar(c,xmatrixImp);
title('Impulse of 100, 125, and 145 Grain Field Tips')
xlabel('')
ylabel('Impulse (I) [kg*m/s]')
b.FaceColor = 'flat';
b.CData(1,:)=[0 0 1];
b.CData(2,:)=[1 0 0];
b.CData(3,:)=[1 1 0.3];
ax = gca;
ax.FontSize = 13;
grid;
hold on ;

% This part of the code calculates how high you should aim to hit your 
% target depending on what weight of arrowhead used and the distance of the
% target 
fprintf('Please answer the questions as prompted for optimal aiming corrections for a 60lb bow.\n')
x = input('What is the weight of your arrowhead in grains? (your options are 100, 125, and 145)\n');
while not (x == 100 || x == 125 || x == 145)
    x = input('What is the weight of your arrowhead in grains? (your options are 100, 125, and 145)\n');
end
if x == 100;
    x = AV100;
elseif x == 125;
    x = AV125;
else x == 145;
    x = AV145;
end

maxD = (x*cos(pi/4))*(2*x*sin(pi/4)/g); % maxD = Vx*2*Vy/g at 45 degrees

D = input('How far away is your target in meters?\n');
if D > maxD
    fprintf('Whoa there! You entered a distance that is beyond the range of your chosen equipment: %.1f meters.\n',maxD)
    D = input('How far away is your target in meters?\n');
end
g=9.81;
ydrop=(1/2)*g*(D/x)^2;
theta = atan(ydrop/D);
degree_theta=radtodeg(theta);
fprintf('To hit your target, adjust angle of release by %.0f degrees, aiming %.1f meters above target.',degree_theta, ydrop)







