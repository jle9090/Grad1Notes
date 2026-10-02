%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW3 Problem 4

clc; clear; close all

% Constants
qe = 1.602176634e-19; % C
kB = 1.380649e-23; % J/K
me = 9.1093837e-31; % kg
mi = 1.67262192e-27; % kg, H+ at GEO

% GEO plasma
n = 0.5e6; % cm^-3 -> m^-3
T = 5e6; % K, Te = Ti
kT = kB * T / qe; % thermal voltage [V]
fprintf('kT/q = %.1f V\n', kT);

% Thermal velocities [m/s]
ve = sqrt(3 * kB * T / me);
vi = sqrt(3 * kB * T / mi);

% Photocurrent (Eq. 28), surface normal to sun
Jph0 = 40e-6; % A/m^2
kTph = 2; % eV

% Random current densities at V = 0 if areas cancel out
Je0 = 0.25*qe*n*ve;
Ji0 = 0.25*qe*n*vi;

% Shadow surface: dQ/dt = Ie + Ii = 0, V < 0
V_neg = linspace(-10*kT, 0, 1e5); % V
dQ_shadow = -Je0*exp(V_neg/kT) + Ji0*(1 - V_neg/kT);
k = find(dQ_shadow < 0, 1, 'first'); % first sign change in net current
V_shadow = interp1(dQ_shadow(k-1:k), V_neg(k-1:k), 0);
fprintf('Shadow potential = %.1f V (%.2f kTe)\n', V_shadow, V_shadow/kT);

% Sunlit surface: dQ/dt = Ie + Ii + Iph = 0, V > 0
V_pos = linspace(0, 100, 1e5); % V
dQ_sun = -Je0*(1 + V_pos/kT) + Ji0*exp(-V_pos/kT) + Jph0*exp(-V_pos/kTph);
k = find(dQ_sun < 0, 1, 'first'); % first sign change in net current
V_sun = interp1(dQ_sun(k-1:k), V_pos(k-1:k), 0);
fprintf('Sunlit potential = %.2f V\n', V_sun);

% Differential charging
dV = V_sun - V_shadow;
fprintf('Potential difference = %.1f V\n', dV);
