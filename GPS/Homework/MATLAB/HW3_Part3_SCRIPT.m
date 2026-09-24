%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW3 Part 3 Main Script
clc;clear;close all

% Reading in rinex
rinexData = rinexread('NIST00USA_R_20262310000_01D_30S_MO.rnx');
rinexDataGPS = rinexData.GPS;

% Read in ephemeris
clean_GPSbroadcast = read_clean_GPSbroadcast('brdc2310.26n', true);

PRN_number = 5;
PRN_index = rinexDataGPS.SatelliteID == PRN_number;
PRN05_GPS_rinexData = rinexDataGPS(PRN_index,:);

[NIST_GPS_week, NIST_GPS_TOW] = utc2gpstime(PRN05_GPS_rinexData.Time);

[health,satPos,satVel,satClkCorr] = eph2pvt2025(clean_GPSbroadcast, [NIST_GPS_week NIST_GPS_TOW], 5);


NIST_ECEF = [-1288398.567 -4721696.932 4078625.350];

ephem_time_s = NIST_GPS_week.*604800 + NIST_GPS_TOW;
ephem_time_hr = NIST_GPS_TOW/3600;

[AZ_NIST, EL_NIST, RANGE_NIST] = compute_azelrange(NIST_ECEF, satPos);

% TODO: Check this nan gapping
gap_idx = [false; diff(ephem_time_s) > 1.5*median(diff(ephem_time_s))];
AZ_NIST(gap_idx) = NaN;
EL_NIST(gap_idx) = NaN;
RANGE_NIST(gap_idx) = NaN;

figure()
plot(ephem_time_hr, AZ_NIST, 'LineWidth', 1.5)
grid minor
xlabel('Time (hr)')
ylabel('Azimuth (deg)')
title(sprintf('PRN %d Azimuth from NIST', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P3_azimuth_PRN5.png'), 'Resolution', 300);

figure()
plot(ephem_time_hr, EL_NIST, 'LineWidth', 1.5)
grid minor
xlabel('Time (hr)')
ylabel('Elevation (deg)')
title(sprintf('PRN %d Elevation from NIST', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P3_elevation_PRN5.png'), 'Resolution', 300);

figure()
plot(ephem_time_hr, RANGE_NIST, 'LineWidth', 1.5)
grid minor
xlabel('Time (hr)')
ylabel('Range (m)')
title(sprintf('PRN %d Range from NIST', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P3_range_PRN5.png'), 'Resolution', 300);

% Expected range corrected for light-time and Earth rotation
R_expected = compute_expected_range(clean_GPSbroadcast, NIST_GPS_week, NIST_GPS_TOW, PRN_number, NIST_ECEF);

R_expected(gap_idx) = NaN;

% Add the expected range to the previous range plot from ephem
figure()
plot(ephem_time_hr, RANGE_NIST, 'LineWidth', 1.5)
grid minor
xlabel('Time (hr)')
ylabel('Range (m)')
title(sprintf('PRN %d Range from NIST', PRN_number))
hold on
plot(ephem_time_hr, R_expected, '--', 'LineWidth', 2.5)
legend('Initial Range', 'Expected Range', 'Location', 'southwest')
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P3_initial_range_vs_expected_PRN5.png'), 'Resolution', 300);

% Plot the difference between the expected initial ranging
range_diff = R_expected - RANGE_NIST;
max_range_diff = max(abs(range_diff))

figure()
plot(ephem_time_hr, range_diff, 'LineWidth', 1.5)
grid minor
xlabel('Time (hr)')
ylabel('Range Difference (m)')
title(sprintf('PRN %d Expected, Range Difference', PRN_number))
set(gcf, 'Units', 'inches', 'Position', [0 0 6 4]);
set(findall(gcf, '-property', 'FontSize'), 'FontSize', 12);
exportgraphics(gcf, fullfile('figures', 'HW3_P3_range_difference_PRN5.png'), 'Resolution', 300);
 