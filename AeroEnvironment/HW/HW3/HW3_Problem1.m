%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW3 Problem 1

clc;clear; close all

% Read IRI output
data = readmatrix('iri_output.txt', 'FileType', 'text', 'NumHeaderLines', 30);
data(data == -1) = NaN; % IRI uses -1 for missing values

alt  = data(:,1); % km
Ne   = data(:,2); % cm^-3
pct  = data(:,7:12); % ion percentages of Ne: O+ N+ H+ He+ O2+ NO+

% Set ion number densities [cm^-3]
n_ion = Ne .* pct / 100;
n_Op  = n_ion(:,1);
n_Hp  = n_ion(:,3);
n_Hep = n_ion(:,4);
n_O2p = n_ion(:,5);
n_NOp = n_ion(:,6);

% Consistent ion colors across figures: O+ H+ O2+ NO+ He+
c = lines(5);

% Plotting
figure;
semilogx(Ne,    alt, 'k-',  'LineWidth', 2); hold on
semilogx(n_Op,  alt, 'Color', c(1,:), 'LineWidth', 1.5);
semilogx(n_Hp,  alt, 'Color', c(2,:), 'LineWidth', 1.5);
semilogx(n_O2p, alt, 'Color', c(3,:), 'LineWidth', 1.5);
semilogx(n_NOp, alt, 'Color', c(4,:), 'LineWidth', 1.5);
semilogx(n_Hep, alt, 'Color', c(5,:), 'LineWidth', 1.5);
grid minor
xlabel('Number Density [cm^{-3}]')
ylabel('Altitude [km]')
title('IRI Ion and Electron Densities')
legend('e^-', 'O^+', 'H^+', 'O_2^+', 'NO^+', 'He^+', 'Location', 'best')
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P1_iri_output.png'), 'Resolution', 900);

% Normalized as percentages
n_plot = [n_Op n_Hp n_O2p n_NOp n_Hep];
pct_norm = 100 * n_plot ./ sum(n_plot, 2, 'omitnan');

figure;
h = plot(pct_norm, alt, 'LineWidth', 1.5);
set(h, {'Color'}, num2cell(c, 2));
grid minor
xlim([0 100])
xlabel('Ion Composition [%]')
ylabel('Altitude [km]')
title('IRI Normalized Ion Composition')
legend('O^+', 'H^+', 'O_2^+', 'NO^+', 'He^+', 'Location', 'best')
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P1_ion_composition.png'), 'Resolution', 900);

% Total electron content (TEC), 1 TECU = 1e16 el/m^2
TECU = 1e16;
z_m  = alt * 1e3; % m
Ne_m = Ne * 1e6;  % m^-3
Ne_m(isnan(Ne_m)) = 0; % no electrons where IRI has no data

[NmF2, k_pk] = max(Ne); % peak electron density splits topside/bottomside
hmF2 = alt(k_pk);

TEC_total  = trapz(z_m, Ne_m) / TECU
TEC_bottom = trapz(z_m(1:k_pk), Ne_m(1:k_pk)) / TECU
TEC_top    = trapz(z_m(k_pk:end), Ne_m(k_pk:end)) / TECU

100*(TEC_bottom/TEC_total)
100*(TEC_top/TEC_total)