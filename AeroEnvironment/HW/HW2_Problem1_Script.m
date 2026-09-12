%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW 2 Problem 1

% using MSISatmosphere, function provides mass at some given alt
% integrate over a range to find total mass

alt_km = 0:1:1000; % altitude vector

n = MSISatmosphere1000(alt_km);

rho_kg_m3 = n.mass*1000; % convert g/cm^3 to kg/m^3

R_E_m = 6371e3; % Radius of the Earth
r_m = R_E_m + alt_km*1000; % distance from Earth's center

% Integrate with trapz function, m = 4pi*integral(rho*r^2 dr)
total_atmos_mass = trapz(r_m, 4*pi*rho_kg_m3.*(r_m.^2)) % kg

% Part ii

R = 8.314; % J/molK
T = 300; % K
M = 0.029; % kg/mol
V = 10*10^3*10*10^3*100*10^3; % m^3

P = (total_atmos_mass/(M*V))*R*T % Pa