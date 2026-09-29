%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW4 Main Script
clc;clear;close all

%% Setup
% Reading in rinex
rinexData = rinexread('NIST00USA_R_20262310000_01D_30S_MO.rnx');
rinexDataGPS = rinexData.GPS;

% Read in ephemeris
clean_GPSbroadcast = read_clean_GPSbroadcast('brdc2310.26n', true);

PRN_number = 14;
PRN_index = rinexDataGPS.SatelliteID == PRN_number;
PRN14_GPS_rinexData = rinexDataGPS(PRN_index,:);
PRN14_GPS_rinexData(1,:) = []; % Kill first data point says Axelrad

% Reading in sp3
sp3 = read_sp3('IGS0OPSFIN_20262310000_01D_15M_ORB.SP3');
satPRN = extract_sp3_prn(sp3);


[NIST_GPS_week, NIST_GPS_TOW] = utc2gpstime(PRN14_GPS_rinexData.Time);

NIST_ECEF = [-1288398.567 -4721696.932 4078625.350];

ephem_time_s = NIST_GPS_week.*604800 + NIST_GPS_TOW;
ephem_time_hr = ephem_time_s/3600;

gap_idx = [false; diff(ephem_time_s) > 1.5*median(diff(ephem_time_s))];

% Expected range corrected for light-time and Earth rotation
[R_expected, AZ_expected, EL_expected] = compute_expected_range(clean_GPSbroadcast, NIST_GPS_week, NIST_GPS_TOW, PRN_number, NIST_ECEF);
R_expected(gap_idx) = NaN;

% Find NIST time in hours
NIST_HR = NIST_GPS_week*604800 + NIST_GPS_TOW;

% Plotting satellite clock correction
[health,satPos,satVel,satClkCorr,~,~,relCorr] = eph2pvt2025(clean_GPSbroadcast, [NIST_GPS_week NIST_GPS_TOW], 14);

%% Problem 1
% a. Plot psuedorange and expected ranges, and then residuals
figure()
plot(ephem_time_hr, R_expected, 'LineWidth', 1.5)
hold on
plot(ephem_time_hr, PRN14_GPS_rinexData.C1C, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('Range (m)')
grid minor
legend('Expected Range R', 'Pseudorange C1C', 'Location', 'best')
title(sprintf('PRN %d C1C Pseudorange and Expected Range', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P1_C1C_vs_R_PRN14.png'), 'Resolution', 300);

figure()
plot(ephem_time_hr, PRN14_GPS_rinexData.C1C-R_expected, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('dPR0 (m)')
grid minor
title(sprintf('PRN %d dPR0 = C1C - R', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P1_dPR0_PRN14.png'), 'Resolution', 300);

% Difference vector between C1C and expected range
dPR0 = PRN14_GPS_rinexData.C1C-R_expected;
fprintf('dPR0 first value: %.4f m\n', dPR0(1));
fprintf('dPR0 last value:  %.4f m\n', dPR0(end));

%% Problem 2
figure()
plot(ephem_time_hr, satClkCorr, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('b_{sv} (m)')
grid minor
title(sprintf('PRN %d Satellite Clock Correction b_{sv}', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P2_bsv_PRN14.png'), 'Resolution', 300);

% Where bsv is SatClkCorr
dPR1 = PRN14_GPS_rinexData.C1C - (R_expected - satClkCorr);

figure()
plot(ephem_time_hr, dPR1, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('dPR1 (m)')
grid minor
title(sprintf('PRN %d dPR1 = C1C - (R - b_{sv})', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P2_dPR1_PRN14.png'), 'Resolution', 300);

fprintf('dPR1 first value: %.4f m\n', dPR1(1));
fprintf('dPR1 last value:  %.4f m\n', dPR1(end));

%% Problem 3
figure()
plot(ephem_time_hr, relCorr, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('rel_{sv} (m)')
grid minor
title(sprintf('PRN %d Relativistic Correction rel_{sv}', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P3_relsv_PRN14.png'), 'Resolution', 300);

% Where bsv is SatClkCorr
dPR2 = PRN14_GPS_rinexData.C1C - (R_expected - satClkCorr - relCorr);

figure()
plot(ephem_time_hr, dPR2, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('dPR2 (m)')
grid minor
title(sprintf('PRN %d dPR2 = C1C - (R - b_{sv} - rel_{sv})', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P3_dPR2_PRN14.png'), 'Resolution', 300);

% TODO make part 2 and part 3 self consistent, where it is a switch case
% within eph2pvt

fprintf('dPR2 first value: %.4f m\n', dPR2(1));
fprintf('dPR2 last value:  %.4f m\n', dPR2(end));

%% Problem 4
% Using the troposphere model we calculated
% Assuming zd = 2 at NIST
zd = 2;
tropo_correction  = tropomodel(zd, EL_expected);

% Plotting the tropospheric model
figure()
plot(ephem_time_hr, tropo_correction, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('Tropo (m)')
grid minor
title(sprintf('PRN %d Tropospheric Correction (z_d = %g m)', PRN_number, zd))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P4_tropo_PRN14.png'), 'Resolution', 300);

% Plotting dPR3 = C1C – (R – bsv - relsv + tropo)

% Where bsv is SatClkCorr
dPR3 = PRN14_GPS_rinexData.C1C - (R_expected - satClkCorr - relCorr + tropo_correction);

% Plotting
figure()
plot(ephem_time_hr, dPR3, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('dPR3 (m)')
grid minor
title(sprintf('PRN %d dPR3 = C1C - (R - b_{sv} - rel_{sv} + tropo)', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P4_dPR3_PRN14.png'), 'Resolution', 300);

fprintf('dPR3 first value: %.4f m\n', dPR3(1));
fprintf('dPR3 last value:  %.4f m\n', dPR3(end));

%% Problem 5
f1 = 1575.42e6; % C1C frequency
f2 = 1227.6e6; % C2L frequency

% Calling ionospheric model
[PRIF12, iono] = ionocorr (PRN14_GPS_rinexData.C1C, f1, PRN14_GPS_rinexData.C2L, f2);

% Plot ionospheric corrections
figure()
plot(ephem_time_hr, iono, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('Iono (m)')
grid minor
title(sprintf('PRN %d Ionospheric Correction (C1C, C2L)', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P5_iono_PRN14.png'), 'Resolution', 300);

% calculate dPR4
dPR4 = PRIF12 - (R_expected - satClkCorr - relCorr + tropo_correction);

% Plot dPR4
figure()
plot(ephem_time_hr, dPR4, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('dPR4 (m)')
grid minor
title(sprintf('PRN %d dPR4 = PRIF12 - (R - b_{sv} - rel_{sv} + tropo)', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P5_dPR4_PRN14.png'), 'Resolution', 300);

fprintf('dPR4 first value: %.4f m\n', dPR4(1));
fprintf('dPR4 last value:  %.4f m\n', dPR4(end));

%% Problem 6
% Plot all on one graph
figure()
plot(ephem_time_hr, dPR1, 'LineWidth', 1.5)
hold on
plot(ephem_time_hr, dPR2, 'LineWidth', 1.5)
plot(ephem_time_hr, dPR3, 'LineWidth', 1.5)
plot(ephem_time_hr, dPR4, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('Residual (m)')
grid minor
legend('dPR1: b_{sv}', 'dPR2: b_{sv} + rel_{sv}', 'dPR3: b_{sv} + rel_{sv} + tropo', 'dPR4: b_{sv} + rel_{sv} + tropo + iono-free', 'Location', 'best')
title(sprintf('PRN %d Pseudorange Residuals dPR1-dPR4', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P6_all_dPRs.png'), 'Resolution', 300);

%% Problem 7

% Each corresponding frequency
f1 = 1575.42e6; % L1 frequency (C1C, L1C)
f2 = 1227.60e6; % L2 frequency (C2W, L2W, C2L, L2L)
f5 = 1176.45e6; % L5 frequency (C5Q, L5Q)

[MP1,CMC1] = mpath(PRN14_GPS_rinexData.C1C, PRN14_GPS_rinexData.L1C, f1, PRN14_GPS_rinexData.L2W, f2);

figure()
subplot(3,1,1)
plot(ephem_time_hr, CMC1, 'LineWidth', 1.5)
ylabel('CMC1')
grid minor
title(sprintf('PRN %d CMC1 (MP w/ L2W)', PRN_number))
subplot(3,1,2)
plot(ephem_time_hr, MP1, 'LineWidth', 1.5)
ylabel('MP1')
grid minor
subplot(3,1,3)
plot(ephem_time_hr, PRN14_GPS_rinexData.S1C, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('S1C (dB-Hz)')
grid minor
set(gcf, 'Units', 'inches', 'Position', [0 0 6 8]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P7_CMC1.png'), 'Resolution', 300);

% Repeat for 

% C1C
% Done above

% C2W
[MP_C2W,CMC_C2W] = mpath(PRN14_GPS_rinexData.C2W, PRN14_GPS_rinexData.L2W, f2, PRN14_GPS_rinexData.L1C, f1);

figure()
subplot(3,1,1)
plot(ephem_time_hr, CMC_C2W, 'LineWidth', 1.5)
ylabel('CMC C2W')
grid minor
title(sprintf('PRN %d CMC C2W (MP w/ L1C)', PRN_number))
subplot(3,1,2)
plot(ephem_time_hr, MP_C2W, 'LineWidth', 1.5)
ylabel('MP C2W')
grid minor
subplot(3,1,3)
plot(ephem_time_hr, PRN14_GPS_rinexData.S2W, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('S2W (dB-Hz)')
grid minor
set(gcf, 'Units', 'inches', 'Position', [0 0 6 8]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P7_CMC_C2W.png'), 'Resolution', 300);

% C2L
[MP_C2L,CMC_C2L] = mpath(PRN14_GPS_rinexData.C2L, PRN14_GPS_rinexData.L2L, f2, PRN14_GPS_rinexData.L1C, f1);

figure()
subplot(3,1,1)
plot(ephem_time_hr, CMC_C2L, 'LineWidth', 1.5)
ylabel('CMC C2L')
grid minor
title(sprintf('PRN %d CMC C2L (MP w/ L1C)', PRN_number))
subplot(3,1,2)
plot(ephem_time_hr, MP_C2L, 'LineWidth', 1.5)
ylabel('MP C2L')
grid minor
subplot(3,1,3)
plot(ephem_time_hr, PRN14_GPS_rinexData.S2L, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('S2L (dB-Hz)')
grid minor
set(gcf, 'Units', 'inches', 'Position', [0 0 6 8]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P7_CMC_C2L.png'), 'Resolution', 300);

% C5Q
[MP_C5Q,CMC_C5Q] = mpath(PRN14_GPS_rinexData.C5Q, PRN14_GPS_rinexData.L5Q, f5, PRN14_GPS_rinexData.L2W, f2);

figure()
subplot(3,1,1)
plot(ephem_time_hr, CMC_C5Q, 'LineWidth', 1.5)
ylabel('CMC C5Q')
grid minor
title(sprintf('PRN %d CMC C5Q (MP w/ L2W)', PRN_number))
subplot(3,1,2)
plot(ephem_time_hr, MP_C5Q, 'LineWidth', 1.5)
ylabel('MP C5Q')
grid minor
subplot(3,1,3)
plot(ephem_time_hr, PRN14_GPS_rinexData.S5Q, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('S5Q (dB-Hz)')
grid minor
set(gcf, 'Units', 'inches', 'Position', [0 0 6 8]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P7_CMC_C5Q.png'), 'Resolution', 300);

% Plot multipath combinations together
figure()
plot(ephem_time_hr, CMC1, 'LineWidth', 1.5)
hold on
plot(ephem_time_hr, CMC_C2W, 'LineWidth', 1.5)
hold on
plot(ephem_time_hr, CMC_C2L, 'LineWidth', 1.5)
hold on
plot(ephem_time_hr, CMC_C5Q, 'LineWidth', 1.5)
hold on
xlabel('Time (hrs)')
ylabel('Pseudoranges (m)')
legend('CMC1', 'CMC C2W', 'CMC C2L', 'CMC C5Q', 'Location', 'best')
grid minor
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
set(findall(gcf, 'Type', 'axes'), 'XTick', floor(min(ephem_time_hr)):2:ceil(max(ephem_time_hr)));
exportgraphics(gcf, fullfile('figures', 'HW4', 'HW4_P7_all_pseudorange.png'), 'Resolution', 300);
