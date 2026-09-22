%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW3 Part 2 Main Script
clc;clear;close all

% Reading in rinex
rinexData = rinexread('NIST00USA_R_20262310000_01D_30S_MO.rnx');
rinexDataGPS = rinex.GPS;


% From assignment
NIST_ECEF = [-1288398.567 -4721696.932 4078625.350];

% Convert ephem time to seconds
ephem_time_s = clean_GPSbroadcast(:,19).*604800 + clean_GPSbroadcast(:,20);
ephem_time_hr = ephem_time_s/3600;

[AZ_NIST, EL_NIST, RANGE_NIST] = compute_azelrange(NIST_ECEF, satPos);

