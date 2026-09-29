%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW4 Part 4 Main Script
clc;clear;close all

% Reading in rinex
rinexData = rinexread('NIST00USA_R_20262310000_01D_30S_MO.rnx');
rinexDataGPS = rinexData.GPS;

% Read in ephemeris
clean_GPSbroadcast = read_clean_GPSbroadcast('brdc2310.26n', true);

PRN_number = 14;
PRN_index = rinexDataGPS.SatelliteID == PRN_number;
PRN14_GPS_rinexData = rinexDataGPS(PRN_index,:);

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

% Difference vector between C1C and expected range
dPR0 = PRN14_GPS_rinexData.C1C-R_expected;
% dPR0(1)
% dPR0(end)

% Plotting satellite clock correction
[health,satPos,satVel,satClkCorr,~,~,relCorr] = eph2pvt2025(clean_GPSbroadcast, [NIST_GPS_week NIST_GPS_TOW], 14);

% Where bsv is SatClkCorr
dPR3 = PRN14_GPS_rinexData.C1C - (R_expected - satClkCorr);

dPR3(1)
dPR3(end)

% Using the troposphere model we calculated
% Assuming zd = 2 at NIST
zd = 2;
tropo_correction  = tropomodel(zd, EL_expected);

% Plotting the tropospheric model
% figure()
% plot(ephem_time_hr, tropo_correction, 'LineWidth', 1.5)
% xlabel('Time (hrs)')
% ylabel('Tropospheric Error (m)')
% grid minor
% title(sprintf('PRN %d Tropospheric Error', PRN_number))
% set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
% set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
% exportgraphics(gcf, fullfile('figures', 'HW4_P3_tropo_corrections.png'), 'Resolution', 300);

% Plotting dPR3 = C1C – (R – bsv - relsv + tropo)

% Where bsv is SatClkCorr
dPR3 = PRN14_GPS_rinexData.C1C - (R_expected - satClkCorr - relCorr + tropo_correction);

% Plotting
% figure()
% plot(ephem_time_hr, dPR3, 'LineWidth', 1.5)
% xlabel('Time (hrs)')
% ylabel('O-C-bsv w/ relativistic error and tropo correction (m)')
% grid minor
% title(sprintf('PRN %d Expected Range C1C Pseudorange Clock Residuals', PRN_number))
% set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
% set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
% exportgraphics(gcf, fullfile('figures', 'HW4_P4_residuals_with_bsv_relativistic_tropo_PRN14.png'), 'Resolution', 300);
% 
% dPR3(1)
% dPR3(end)

f1 = 1575.42e6; % C1C frequency
f2 = 1227.6e6; % C2L frequency

% Calling ionospheric model
[PRIF12, iono] = ionocorr (PRN14_GPS_rinexData.C1C, f1, PRN14_GPS_rinexData.C2L, f2);

% Plot ionospheric corrections
figure()
plot(ephem_time_hr, iono, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('Ionospheric Correction (m)')
grid minor
title(sprintf('PRN %d Ionospheric Correction', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW4_P5_iono_corrections_PRN14.png'), 'Resolution', 300);

% calculate dPR4
dPR4 = PRIF12 - (R_expected - satClkCorr - relCorr + tropo_correction);

% Plot dPR4
figure()
plot(ephem_time_hr, dPR4, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('O-C-bsv w/ relativistic error and tropo correction and ionospheric model (m)')
grid minor
title(sprintf('PRN %d Expected Range C1C Pseudorange Clock Residuals', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW4_P5_residuals_with_bsv_relativistic_tropo_iono_PRN14.png'), 'Resolution', 300);
