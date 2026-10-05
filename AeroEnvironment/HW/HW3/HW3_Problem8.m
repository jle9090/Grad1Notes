%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW3 Problem 8

clc; clear; close all
addpath(fullfile('..', 'HW2')) % MSISatmosphere1000.m

% Read IRI output
data = readmatrix('iri_output.txt', 'FileType', 'text', 'NumHeaderLines', 30);
data(data == -1) = NaN; % IRI uses -1 for missing values

alt = data(:,1); % km
Ne  = data(:,2) * 1e6; % Convert cm^-3 to m^-3
Te  = data(:,6); % K
Ne(isnan(Ne)) = 0; % no electrons where IRI has no data

% Neutral densities from MSIS [cm^-3]
msis = MSISatmosphere1000(alt);
n_n  = msis.n2 + msis.o2 + msis.o;

% Electron-neutral collision frequency [s^-1]
nu = 5.4e-10 * n_n .* sqrt(Te);
nu(isnan(nu)) = 0;

% Constants
qe = 1.602176634e-19; % C
me = 9.1093837e-31; % kg
B0 = 50000e-9; % T

% Wave and gyro frequencies [rad/s]
f   = 10e6; % Hz
w   = 2*pi*f;
w_c = qe * B0 / me;
fprintf('f_H = %.2f MHz\n', w_c/(2*pi*1e6));

% Differential absorption [dB/m] for + (w + w_c) and - (w - w_c) solutions
dAdl_plus = 4.6e-5 * Ne .* nu ./ (nu.^2 + (w + w_c)^2);
dAdl_minus = 4.6e-5 * Ne .* nu ./ (nu.^2 + (w - w_c)^2);

% Total attenuation along vertical path [dB]
z_m = alt * 1e3; % m
A_plus = trapz(z_m, dAdl_plus);
A_minus = trapz(z_m, dAdl_minus);
fprintf('A+ attenuation = %.2f dB\n', A_plus);
fprintf('A- attenuation = %.2f dB\n', A_minus);

% Plot differential absorption profile
figure;
plot(dAdl_plus, alt, 'LineWidth', 1.5); hold on
plot(dAdl_minus, alt, 'LineWidth', 1.5);
grid minor
ylim([50 200])
xlabel('Differential Absorption [dB/m]')
ylabel('Altitude [km]')
title('10 MHz D-region Absorption')
legend('+ solution', '- solution', 'Location', 'best')
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P8_absorption.png'), 'Resolution', 300)
