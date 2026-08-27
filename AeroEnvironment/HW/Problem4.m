%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW1 Problem 4

clc;clear;close all

% Defining constants
c = 3E8; %[m/s]
meV_2_KE = 1.602E-13; %[J]
m_0 = 1.67E-27; %[kg]

Au = 1.496E11; %[m]
R_s = 6.957E8; %[m]

d = Au-2*R_s;


% Given conditions
meV = [1, 10, 100, 500]; %[meV]

% Convert to energy [J]

KE = meV.*meV_2_KE;

%Calculate velocity
v_ms = c*sqrt(1 - 1./(KE./(m_0*c^2) + 1).^2); %[m/s] 

% Finding time from v=d/t
t_s = d./v_ms;

%% Plot distance traveled vs. time

t = linspace(0, max(t_s), 1000); % [s]

distance = v_ms'.*t; % [m]
distance_AU = distance./Au; % [AU]
time_days = t./(24*3600); % [days]

figure
plot(time_days, distance_AU, 'LineWidth', 2)
xlabel('Time [days]')
ylabel('Distance Traveled [AU]')
title('Distance Traveled vs. Time for Protons')
legend('1 MeV', '10 MeV', '100 MeV', '500 MeV', 'Location', 'northwest')
grid on

exportgraphics(gcf, 'AeroEnvHW1P4_solarparticle.png', 'Resolution', 300);