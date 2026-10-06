%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW3 Problem 5

clc; clear; close all

% Read IRI output
data = readmatrix('iri_output.txt', 'FileType', 'text', 'NumHeaderLines', 30);
data(data == -1) = NaN; % IRI uses -1 for missing values

alt = data(:,1); % km
Ne  = data(:,2); % cm^-3
Ne(isnan(Ne)) = 0;

% Critical frequency profile [MHz], Module 3 Eq. 31 (n_e in cm^-3)
fc = 9e-3 * sqrt(Ne);

% (i) Critical frequency foF2 = minimum frequency to reach space
[foF2, k_pk] = max(fc);
hmF2 = alt(k_pk);
fprintf('foF2 = %.2f MHz at %.0f km\n', foF2, hmF2);

% (iii) Reflection altitude of a 2 MHz wave: first altitude where fc = f
f = 2; % MHz
k = find(fc >= f, 1, 'first');
z_reflect = interp1(fc(k-1:k), alt(k-1:k), f);
fprintf('2 MHz reflects at %.1f km\n', z_reflect);

% Topside reflection altitude: last altitude where fc = f (space-to-ground)
k2 = find(fc >= f, 1, 'last');
z_reflect_top = interp1(fc(k2:k2+1), alt(k2:k2+1), f);
fprintf('2 MHz reflects on the topside at %.1f km\n', z_reflect_top);

% Plot critical frequency profile
figure;
plot(fc, alt, 'k-', 'LineWidth', 2); hold on
xline(f, 'r--', '2 MHz', 'LineWidth', 1.5);
yline(z_reflect, 'b--', sprintf('%.0f km', z_reflect), 'LineWidth', 1.5);
yline(z_reflect_top, 'b--', sprintf('%.0f km', z_reflect_top), 'LineWidth', 1.5);
grid minor
xlabel('Critical Frequency [MHz]')
ylabel('Altitude [km]')
title('IRI Critical Frequency Profile')
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P5_plasma_freq_rev.png'), 'Resolution', 300)