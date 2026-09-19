%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW2 Problem 3

clc;clear; close all

SOLAR_MAX = readmatrix('nrlmsis_output_SOLAR_MAX.txt');
SOLAR_MIN = readmatrix('nrlmsis_output_SOLAR_MIN.txt');

alt_max_km = SOLAR_MAX(:,6); % Height km
alt_min_km = SOLAR_MIN(:,6);

% Reading in species mass densities
O_max = SOLAR_MAX(:,9);
N2_max = SOLAR_MAX(:,10);
O2_max = SOLAR_MAX(:,11);
total_mass_max = SOLAR_MAX(:,12);
He_max = SOLAR_MAX(:,15);
Ar_max = SOLAR_MAX(:,16);
H_max = SOLAR_MAX(:,17);
N_max = SOLAR_MAX(:,18);

O_min = SOLAR_MIN(:,9);
N2_min = SOLAR_MIN(:,10);
O2_min = SOLAR_MIN(:,11);
total_mass_min = SOLAR_MIN(:,12);
He_min = SOLAR_MIN(:,15);
Ar_min = SOLAR_MIN(:,16);
H_min = SOLAR_MIN(:,17);
N_min = SOLAR_MIN(:,18);

% NRLMSIS uses 0 or 1e-38 for small densities, filter these out
O_max(O_max < 1e-30) = NaN;
N2_max(N2_max < 1e-30) = NaN;
O2_max(O2_max < 1e-30) = NaN;
total_mass_max(total_mass_max < 1e-30) = NaN;
He_max(He_max < 1e-30) = NaN;
Ar_max(Ar_max < 1e-30) = NaN;
H_max(H_max < 1e-30) = NaN;
N_max(N_max < 1e-30) = NaN;

O_min(O_min < 1e-30) = NaN;
N2_min(N2_min < 1e-30) = NaN;
O2_min(O2_min < 1e-30) = NaN;
total_mass_min(total_mass_min < 1e-30) = NaN;
He_min(He_min < 1e-30) = NaN;
Ar_min(Ar_min < 1e-30) = NaN;
H_min(H_min < 1e-30) = NaN;
N_min(N_min < 1e-30) = NaN;

colors = hsv(8);

figure
set(gca, 'YScale', 'log'); % plot as log plot
hold on
semilogy(alt_max_km, O_max, '-', 'Color', colors(1,:), 'LineWidth', 1.5, 'DisplayName', 'O - Solar Max')
semilogy(alt_min_km, O_min, '--', 'Color', colors(1,:), 'LineWidth', 1.5, 'DisplayName', 'O - Solar Min')
semilogy(alt_max_km, N2_max, '-', 'Color', colors(2,:), 'LineWidth', 1.5, 'DisplayName', 'N_2 - Solar Max')
semilogy(alt_min_km, N2_min, '--', 'Color', colors(2,:), 'LineWidth', 1.5, 'DisplayName', 'N_2 - Solar Min')
semilogy(alt_max_km, O2_max, '-', 'Color', colors(3,:), 'LineWidth', 1.5, 'DisplayName', 'O_2 - Solar Max')
semilogy(alt_min_km, O2_min, '--', 'Color', colors(3,:), 'LineWidth', 1.5, 'DisplayName', 'O_2 - Solar Min')
semilogy(alt_max_km, total_mass_max, '-', 'Color', colors(4,:), 'LineWidth', 1.5, 'DisplayName', 'Total Mass Density - Solar Max')
semilogy(alt_min_km, total_mass_min, '--', 'Color', colors(4,:), 'LineWidth', 1.5, 'DisplayName', 'Total Mass Density - Solar Min')
semilogy(alt_max_km, He_max, '-', 'Color', colors(5,:), 'LineWidth', 1.5, 'DisplayName', 'He - Solar Max')
semilogy(alt_min_km, He_min, '--', 'Color', colors(5,:), 'LineWidth', 1.5, 'DisplayName', 'He - Solar Min')
semilogy(alt_max_km, Ar_max, '-', 'Color', colors(6,:), 'LineWidth', 1.5, 'DisplayName', 'Ar - Solar Max')
semilogy(alt_min_km, Ar_min, '--', 'Color', colors(6,:), 'LineWidth', 1.5, 'DisplayName', 'Ar - Solar Min')
semilogy(alt_max_km, H_max, '-', 'Color', colors(7,:), 'LineWidth', 1.5, 'DisplayName', 'H - Solar Max')
semilogy(alt_min_km, H_min, '--', 'Color', colors(7,:), 'LineWidth', 1.5, 'DisplayName', 'H - Solar Min')
semilogy(alt_max_km, N_max, '-', 'Color', colors(8,:), 'LineWidth', 1.5, 'DisplayName', 'N - Solar Max')
semilogy(alt_min_km, N_min, '--', 'Color', colors(8,:), 'LineWidth', 1.5, 'DisplayName', 'N - Solar Min')
grid on
xlabel('Altitude (km)')
ylabel('Density (g/cm^3)')
title('NRLMSIS Species Density Profiles: Solar Max vs Solar Min')
legend('Location', 'eastoutside')

set(gcf, 'Units', 'inches', 'Position', [0 0 12 4]) % smaller physical size for the doc
exportgraphics(gcf, 'NRLMSIS_Species_Density_Profiles.png', 'Resolution', 600);