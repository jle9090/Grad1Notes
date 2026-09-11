%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW 2 Problem 1

% using MSISatmosphere, function provides mass at some given alt
% integrate over a range to find total mass

alt_km = 0:1:1000; % altitude vector, km

n = MSISatmosphere1000(alt_km); % pass km, matching the function's table

rho_g_cm3 = n.mass; % Given density at some altitude
rho_kg_m3 = rho_g_cm3*1000; % Conversion

% mass of each thin shell = density * shell_area * shell_thickness

R_E_m = 6371e3; % Radius of the Earth in meters
r_m = R_E_m + alt_km*1000; % distance from Earth's center, m

shell_area_m2 = 4*pi*r_m.^2; % surface area of the shell at each altitude
shell_mass_per_m = rho_kg_m3.*shell_area_m2; % kg of atmosphere per meter of altitude

dr_m = 1000; % altitude step size in meters (uniform 1 km grid)
total_atmos_mass = dr_m * (sum(shell_mass_per_m) - 0.5*(shell_mass_per_m(1) + shell_mass_per_m(end))) % kg, manual trapezoidal rule

thing = trapz((4*pi.*(r_m).^2) .* rho_kg_m3, r_m)