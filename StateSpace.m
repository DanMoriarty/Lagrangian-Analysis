%Advanced Dynamics Project, Group 8. Pendulum on Spring.
%Utility function. Function handle is used by ode45 solver.

function [ x_dot ] = StateSpace(t, x)
%State-space model
%x1=l_m, x2=theta, x3=phi
EPS = 0.0001;
parameters;

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
x5 = x(5);
x6 = x(6);


x1_dot = x4;
x2_dot = x5;
x3_dot = x6;
x4_dot = (1/mm)*(-c_d*x4-k*(x1-S)) + g*cos(x3) + x6^2*x1 + x5^2*x1*(sin(x3))^2;
x5_dot = (-2*x5*x1*x6*cos(x3) - 2*x5*x4*sin(x3)-(c_f1*x5)/(mm*x1*sin(x3))) / (x1*sin(x3));
x6_dot = (-g*sin(x3) - 2*x6*x4 + x5^2*x1*sin(x3)*cos(x3)-(c_f2*x6)/(mm*x1)) / x1;

if x3<EPS && x3>-EPS && CORRECT_ON
    x5_dot=0;
end
%If phi gets very small, set theta_ddot to be zero, to avoid the divide by
%sin(phi) problem.

x_dot = [x1_dot;x2_dot;x3_dot;x4_dot;x5_dot;x6_dot];
end