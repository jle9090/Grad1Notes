%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW3 Part 4 Main Script
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

NIST_ECEF = [-1288398.567 -4721696.932 4078625.350];

ephem_time_s = NIST_GPS_week.*604800 + NIST_GPS_TOW;
ephem_time_hr = ephem_time_s/3600;

gap_idx = [false; diff(ephem_time_s) > 1.5*median(diff(ephem_time_s))];

% Expected range corrected for light-time and Earth rotation
R_expected = compute_expected_range(clean_GPSbroadcast, NIST_GPS_week, NIST_GPS_TOW, PRN_number, NIST_ECEF);
R_expected(gap_idx) = NaN;

% a. Plot psuedorange and expected ranges, and then residuals
figure()
plot(ephem_time_hr, R_expected, 'LineWidth', 1.5)
hold on
plot(ephem_time_hr, PRN05_GPS_rinexData.C1C, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('Range (m)')
grid minor
legend('Expected Range', 'Pseudorange', 'Location', 'best')
title(sprintf('PRN %d Pseudorange and Expected Range', PRN_number))

figure()
plot(ephem_time_hr, R_expected-PRN05_GPS_rinexData.C1C, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('Range (m)')
grid minor
title(sprintf('PRN %d Expected Range C1C Pseudorange Residuals', PRN_number))
