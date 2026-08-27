%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW1 Script

clc; clear; close all

% Defining constants
v0 = 50; % [m/s]
x0 = 250; % [m]
h0 = 100; % [m]

% Equations are a function of xA
xa = linspace(-100,100);

% Ranging Equation
R = sqrt(xa.^2 + h0^2);

% Range Rate Equation
R_dot = xa.*v0.*(xa.^2+h0^2).^(-1/2);

% Zenith Equation
z = atan2(xa,h0);


% Plotting Results
figure()

subplot(3,1,1)
plot(xa, R, 'LineWidth', 1.5)
grid on
xlabel('x_A')
ylabel('R [m]')
title('Range')

subplot(3,1,2)
plot(xa, R_dot, 'LineWidth', 1.5)
grid on
xlabel('x_A')
ylabel('R_dot [m/s]')
title('Range Rate')

subplot(3,1,3)
plot(xa, z, 'LineWidth', 1.5)
grid on
xlabel('x_A')
ylabel('z (rad)')
title('Zenith Angle')
