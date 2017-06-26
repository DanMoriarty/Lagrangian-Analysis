%Advanced Dynamics Project, Group 8. Pendulum on Spring.
%Parameter sheet. Change these values to change the simulation.

%Model physical properties
g = 9.81;
mm = 0.2;
c_d = 0.5;
c_f1 = 0.5;
c_f2 = c_f1;
k = 300;
S = 5; %S=A1+l_0+A2, the constant lengths of the string
l_0 = 2;
A1 = (S-l_0)/2;
A2 = A1;

%Initial conditions ([lm, theta, phi, lm_d, theta_d, phi_d])
x_initial = [6;0;pi/8;0;1;0];

%Time intervals
T0 = 0;
TF = 10;
dt = 0.01;

%Switch on correction for if phi gets too small
CORRECT_ON = 1;