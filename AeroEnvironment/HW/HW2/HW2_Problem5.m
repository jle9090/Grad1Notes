%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW2 Problem 5

clc;clear; close all

% Constants
G = 6.67e-11;
M_E = 5.972e24;
R_E_m = 6371e3;
C_D = 2.2;
m_sat_kg = 4; % From earlier in notes
A_x_m2 = 0.09;
A_z_m2 = 0.01;
stop_alt_km = 120;

% Part ii, 400 km altitude in +x direction
[t2_days, alt2_km] = simulateDecay(400, A_x_m2, stop_alt_km, G, M_E, R_E_m, C_D, m_sat_kg);
% Part iii, 500 km in +x direction
[t3_days, alt3_km] = simulateDecay(500, A_x_m2, stop_alt_km, G, M_E, R_E_m, C_D, m_sat_kg);
% Part iv, 400 km altitude in +z direction
[t4_days, alt4_km] = simulateDecay(400, A_z_m2, stop_alt_km, G, M_E, R_E_m, C_D, m_sat_kg);

figure
plot(t2_days, alt2_km, 'LineWidth', 1.5)
grid on
xlabel('Time (days)')
ylabel('Altitude (km)')
title('Orbital Decay: 400 km Start, Ram in +X')
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4])
exportgraphics(gcf, 'HW2Problem5_OrbitDecay_400km_x.png', 'Resolution', 600);

figure
plot(t3_days, alt3_km, 'LineWidth', 1.5)
grid on
xlabel('Time (days)')
ylabel('Altitude (km)')
title('Orbital Decay: 500 km Start, Ram in +X')
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4])
exportgraphics(gcf, 'HW2Problem5_OrbitDecay_500km_x.png', 'Resolution', 600);

figure
plot(t4_days, alt4_km, 'LineWidth', 1.5)
grid on
xlabel('Time (days)')
ylabel('Altitude (km)')
title('Orbital Decay: 400 km Start, Ram in +Z')
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4])
exportgraphics(gcf, 'HW2Problem5_OrbitDecay_400km_z.png', 'Resolution', 600);

function [t_days, alt_km] = simulateDecay(alt0_km, A_m2, stop_alt_km, G, M_E, R_E_m, C_D, m_sat)
% Calculate orbital elements at this time point
a = R_E_m + alt0_km*1000;
P = 2*pi*sqrt(a^3/(G*M_E));

% Conditions to iterate
t = 0;
altitude_index = 1;
t_hist(altitude_index) = 0;
alt_hist(altitude_index) = alt0_km;

% At start, alt = alt0.
alt_current_km = alt0_km;
% Loop until sat deorbits
while alt_current_km > stop_alt_km
    % Find density at that altitude
    MSIS = MSISatmosphere1000(alt_current_km);
    rho = MSIS.mass*1000;
    
    % Equation 10 and find change in Period
    dPdt = -3*pi*a*rho*C_D*A_m2/m_sat;
    
    dt = 600;

    P = P + dPdt*dt;
    t = t + dt;

    a = (G*M_E*P^2/(4*pi^2))^(1/3);
    alt_current_km = (a - R_E_m)/1000

    altitude_index = altitude_index + 1;
    t_hist(altitude_index) = t/86400; % Convert to days
    alt_hist(altitude_index) = alt_current_km;
end

t_days = t_hist;
alt_km = alt_hist;

end
