%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW3 Problem 5

clc; clear; close all

% Read IRI output
data = readmatrix('iri_output.txt', 'FileType', 'text', 'NumHeaderLines', 30);
data(data == -1) = NaN; % IRI uses -1 for missing values

alt = data(:,1); % km
Ne  = data(:,2) * 1e6; % cm^-3 -> m^-3
Ne(isnan(Ne)) = 0;

% Constants
qe   = 1.602176634e-19; % C
me   = 9.1093837e-31; % kg
eps0 = 8.8541878128e-12; % F/m

% Plasma frequency profile [Hz]
fp = sqrt(Ne * qe^2 / (me * eps0)) / (2*pi);

% (i) Critical frequency foF2 = minimum frequency to reach space
[foF2, k_pk] = max(fp);
hmF2 = alt(k_pk);
fprintf('foF2 = %.2f MHz at %.0f km\n', foF2/1e6, hmF2);

% (iii) Reflection altitude of a 2 MHz wave: first altitude where fp = f
f = 2e6; % Hz
k = find(fp >= f, 1, 'first');
z_reflect = interp1(fp(k-1:k), alt(k-1:k), f);
fprintf('2 MHz reflects at %.1f km\n', z_reflect);

% Plot plasma frequency profile
figure;
plot(fp/1e6, alt, 'k-', 'LineWidth', 2); hold on
xline(f/1e6, 'r--', '2 MHz', 'LineWidth', 1.5);
yline(z_reflect, 'b--', sprintf('%.0f km', z_reflect), 'LineWidth', 1.5);
grid minor
xlabel('Plasma Frequency [MHz]')
ylabel('Altitude [km]')
title('IRI Plasma Frequency Profile')
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P5_plasma_freq.png'), 'Resolution', 300)