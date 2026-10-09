%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW5 Main Script
clc;clear;close all

%% Reading in data
% Reading in rinex
rinexData = rinexread('NIST00USA_R_20262310000_01D_30S_MO.rnx');
rinexDataGPS = rinexData.GPS;

% Read in ephemeris
clean_GPSbroadcast = read_clean_GPSbroadcast('brdc2310.26n', true);

%% Part 1
[PIF, R1, EL, AZ, BSV, RELAT, TROP] = singlepointsolution(PRN, rinexDataGPS.C1C, rinexDataGPS.C2W, f1,f2, rinexDataGPS, ephemeris, user_ECEF);