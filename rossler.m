clear all;
clc;

ICs=[5, 5, 5];  % initial condition
t=[0, 50];      % you can change the range
OPTs = odeset('reltol', 1e-6, 'abstol', 1e-8);  % Optional ODE options set up
[time, fOUT]=ode45(@ross, t, ICs, OPTs); %ode45 ross matlab paketi ross yerine  
%LORENZ_sys_1ODE de kullanılabilir.
close all 
figure 
plot3(fOUT(:,1), fOUT(:,2), fOUT(:,3)), grid
xlabel('x(t)'), ylabel('y(t)'), zlabel('z(t)')
title('LORENZ functions x(t) vs. y(t) vs. z(t)')
axis tight
figure 
comet3(fOUT(:,1), fOUT(:,2), fOUT(:,3))
figure
subplot(311)
plot(time, fOUT(:,1), 'b','linewidth', 3), grid minor
title 'LORENZ functions x(t), y(t), z(t)', xlabel 'time', ylabel 'x(t)'
subplot(312)
plot( time', fOUT(:,2), 'r', 'linewidth', 2 ), grid minor
xlabel 'time', ylabel 'y(t)'
subplot(313)
plot(time, fOUT(:,3),'k', 'linewidth', 2), grid minor, xlabel 'time', ylabel 'z(t)'
figure
plot(fOUT(:,1), fOUT(:,2), 'b', 'linewidth', 1.5)
grid minor, title('LORENZ functions'), xlabel('x(t)'), ylabel 'y(t)'
axis square
figure
plot(fOUT(:,1), fOUT(:,3), 'k', 'linewidth', 1.5)
grid minor, title('LORENZ functions'), xlabel('x(t)'), ylabel 'z(t)'
axis square
figure
plot(fOUT(:,2), fOUT(:,3), 'm', 'linewidth', 1.5)
grid minor, title('LORENZ functions'), xlabel('y(t)'), ylabel 'z(t)'
axis square


function  df = ross(~, x)
% Rossler Functions
% dx/dt=-y-z;
% dy/dt= x+a*y;
% dz/dt= b+z*(x-c)]
a=0.2; 
b=0.2; 
c=3;
% ICs: x(0)=5; y(0)=5; z(0)=5;  % Your ICs
df=[-x(2)-x(3); ...
    x(1)+a*x(2);...
    b+x(3).*x(1)-x(3)*c];
end



