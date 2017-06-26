%Advanced Dynamics Project, Group 8. Pendulum on Spring.
%Main script, run this script to start simulation.
%Change initial conditions by accessing parameters.m

clear;
clc;
close all;
parameters; %run parameters script

x_dot = @(t, x) StateSpace(t, x);
tspan = [T0 TF];
options = odeset('RelTol', 1e-12);
sol = ode45(x_dot, tspan, x_initial, options);
t = tspan(1):dt:tspan(2);
x = deval(sol,t);

plot(t,x)
title('Amplitude Vs Time')
legend('lm', 'theta', 'phi', 'lm-dot', 'theta-dot', 'phi-dot')
xlabel('Time')
ylabel('Amplitude')

%Create mass m
[x1, y1, z1] = sphere(20);
scale=0.5;
x1 = scale*x1;
y1 = scale*y1;
z1 = scale*z1;

%pendulum string
[x2, y2, z2] = cylinder(0.01, 10);
z2 = -z2;

fps = 0.5/dt;
MyVideo = VideoWriter('myvid','MPEG-4');
MyVideo.FrameRate = fps;
open(MyVideo);

handle = figure;
hold on
for i = 1:length(t)
    cla
    
    lm = x(1, i);
    theta = x(2, i);
    phi = x(3, i);
    
    R01 = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
    R12 = [cos(phi) 0 -sin(phi); 0 1 0; sin(phi) 0 cos(phi)];
    
    %spring
    len = 0:pi/50:2*pi;
    st = sin(10*len)/2;
    ct = cos(10*len)/2;
    len = len*(lm-A1-A2)/(2*pi);
    len = -len-A1;
    
    
    [x1_rotated,y1_rotated,z1_rotated] = rotation(x1,y1,z1-lm,R01*R12);
    [x2_rotated,y2_rotated,z2_rotated] = rotation(x2,y2,z2*lm,R01*R12);
    [x4_rotated,y4_rotated,z4_rotated] = rotation(st, ct, len, R01*R12);
    
    surf(x1_rotated,y1_rotated,z1_rotated);
    surf(x2_rotated,y2_rotated,z2_rotated);
    plot3(x4_rotated,y4_rotated,z4_rotated);
    
    axisscale = 7;
    axis([-axisscale axisscale -axisscale axisscale -axisscale axisscale]);
    view(135, 30);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    lims = axis;
    plot3([0 lims(2)], [0 0], [0 0]);
    plot3([0 0], [0 lims(4)], [0 0]);
    plot3([0 0], [0 0], [0 lims(6)]);
    
    writeVideo(MyVideo,getframe(handle));
end

close(MyVideo);