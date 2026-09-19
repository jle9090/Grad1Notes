%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW2 Problem 2

clc;clear; close all

% Constants
k=1.38E-23;
T=300;
g=9.81;

%g/mol to kg conversion
gmol2kg = (1/(1000*6.02E23));

% air
amu_air = 28.0124*(0.781) + 31.9988*(0.209);
m_air = amu_air*gmol2kg;
H_air = (k*T)/(m_air*g)
% atomic oxygen
amu_oxygen = 31.9988/2;
m_oxygen = amu_oxygen*gmol2kg;
H_oxygen = (k*T)/(m_oxygen*g)
% helium
amu_helium = 4.0026;
m_helium = amu_helium*gmol2kg;
H_helium = (k*T)/(m_helium*g)
% hydrogen
amu_hydrogen = 2.01594;
m_hydrogen= amu_hydrogen*gmol2kg;
H_hydrogen = (k*T)/(m_hydrogen*g)

% Convert to km
H_air_km = H_air/1000
H_oxygen_km = H_oxygen/1000
H_helium_km = H_helium/1000
H_hydrogen_km = H_hydrogen/1000

amu_n2 = 28.0134;
amu_o2 = 31.9988;
amu_ar = 39.948;
amu_n = 14.0067;
m_n2 = amu_n2*gmol2kg;
m_o2 = amu_o2*gmol2kg;
m_ar = amu_ar*gmol2kg;
m_n = amu_n*gmol2kg;

% Some range of altitude
alt_range_km = (0:5:1000)';
N = length(alt_range_km);

T_MSIS = zeros(N,1);
n_n2_MSIS = zeros(N,1);
n_o2_MSIS = zeros(N,1);
n_o_MSIS = zeros(N,1);
n_he_MSIS = zeros(N,1);
n_ar_MSIS = zeros(N,1);
n_h_MSIS = zeros(N,1);
n_n_MSIS = zeros(N,1);

% Loop through entire altitude range and return MSIS information
for i = 1:N
    MSIS_i = MSISatmosphere1000(alt_range_km(i));
    T_MSIS(i) = MSIS_i.temp;
    n_n2_MSIS(i) = MSIS_i.n2;
    n_o2_MSIS(i) = MSIS_i.o2;
    n_o_MSIS(i) = MSIS_i.o;
    n_he_MSIS(i) = MSIS_i.he;
    n_ar_MSIS(i) = MSIS_i.ar;
    n_h_MSIS(i) = MSIS_i.h;
    n_n_MSIS(i) = MSIS_i.n;
end

% Density conversions
rho_n2_MSIS = n_n2_MSIS*1e6*m_n2;
rho_o2_MSIS = n_o2_MSIS*1e6*m_o2;
rho_oxygen_MSIS = n_o_MSIS*1e6*m_oxygen;
rho_helium_MSIS = n_he_MSIS*1e6*m_helium;
rho_ar_MSIS = n_ar_MSIS*1e6*m_ar;
rho_hydrogen_MSIS = n_h_MSIS*1e6*m_hydrogen;
rho_n_MSIS = n_n_MSIS*1e6*m_n;

% Calculate scale height
H_n2_MSIS_km = (k*T_MSIS)/(m_n2*g)/1000;
H_o2_MSIS_km = (k*T_MSIS)/(m_o2*g)/1000;
H_oxygen_MSIS_km = (k*T_MSIS)/(m_oxygen*g)/1000;
H_helium_MSIS_km = (k*T_MSIS)/(m_helium*g)/1000;
H_ar_MSIS_km = (k*T_MSIS)/(m_ar*g)/1000;
H_hydrogen_MSIS_km = (k*T_MSIS)/(m_hydrogen*g)/1000;
H_n_MSIS_km = (k*T_MSIS)/(m_n*g)/1000;

% Plotting
figure
tl = tiledlayout(2,1);

nexttile
semilogx(rho_n2_MSIS, H_n2_MSIS_km, 'LineWidth', 1.5, 'DisplayName', 'N_2')
hold on
semilogx(rho_o2_MSIS, H_o2_MSIS_km, 'LineWidth', 1.5, 'DisplayName', 'O_2')
semilogx(rho_oxygen_MSIS, H_oxygen_MSIS_km, 'LineWidth', 1.5, 'DisplayName', 'Atomic Oxygen')
semilogx(rho_helium_MSIS, H_helium_MSIS_km, 'LineWidth', 1.5, 'DisplayName', 'Helium')
semilogx(rho_ar_MSIS, H_ar_MSIS_km, 'LineWidth', 1.5, 'DisplayName', 'Argon')
semilogx(rho_hydrogen_MSIS, H_hydrogen_MSIS_km, 'LineWidth', 1.5, 'DisplayName', 'Hydrogen')
semilogx(rho_n_MSIS, H_n_MSIS_km, 'LineWidth', 1.5, 'DisplayName', 'Atomic Nitrogen')
grid on
xlabel('Mass Density (kg/m^3)')
ylabel('Scale Height (km)')
title('MSIS-derived Scale Height vs Mass Density')

nexttile
semilogx(rho_n2_MSIS, alt_range_km, 'LineWidth', 1.5, 'DisplayName', 'N_2')
hold on
semilogx(rho_o2_MSIS, alt_range_km, 'LineWidth', 1.5, 'DisplayName', 'O_2')
semilogx(rho_oxygen_MSIS, alt_range_km, 'LineWidth', 1.5, 'DisplayName', 'Atomic Oxygen')
semilogx(rho_helium_MSIS, alt_range_km, 'LineWidth', 1.5, 'DisplayName', 'Helium')
semilogx(rho_ar_MSIS, alt_range_km, 'LineWidth', 1.5, 'DisplayName', 'Argon')
semilogx(rho_hydrogen_MSIS, alt_range_km, 'LineWidth', 1.5, 'DisplayName', 'Hydrogen')
semilogx(rho_n_MSIS, alt_range_km, 'LineWidth', 1.5, 'DisplayName', 'Atomic Nitrogen')
grid on
xlabel('Mass Density (kg/m^3)')
ylabel('Altitude (km)')
title('MSIS Mass Density vs Altitude')

lgd = legend('Location', 'eastoutside');
lgd.Layout.Tile = 'east';

set(gcf, 'Units', 'inches', 'Position', [0 0 8 10])
exportgraphics(gcf, 'HW2Problem2_scaleheight_vs_altitude.png', 'Resolution', 600);