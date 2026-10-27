%% ASEN 5090 GPS/GNSS
%% Justin Le
%% FALL 2026 MIDTERM SCRIPT PART 1

clc;clear;close all

% constants
c = 3E8;% m/s
mu_E = 398600.5; %km^3/s^2

%% Problem 1:
% a. Find satellite speed

% constatns
R_E = 6380; %km

r_GPS = 26560; %km
i_GPS = 55; %deg

r_LEO = R_E + 800; %km
i_LEO = 55; %deg

f_GPS = 1575.42E6; %Hz, GPS L1 band
f_LEO = 8E9; %Hz

% Use formula for circular orbits
v_GPS = sqrt(mu_E/r_GPS)
v_LEO = sqrt(mu_E/r_LEO)

% b. Calculate minimum geometrical range

% Assume an observer on the equator where satellites pass overhead.
rObsLLA = [0,0,0];
rObsECEF = lla2ecef(rObsLLA, 0, 6380E3) % m
rObsECEF = rObsECEF./1000 % km

rObs = norm(rObsECEF);
el=90;
r_min_diff_GPS = sqrt( rObs.^2*(sind(el).^2-1) + r_GPS.^2) - rObs*sind(el)
r_min_diff_LEO = sqrt( rObs.^2*(sind(el).^2-1) + r_LEO.^2) - rObs*sind(el)


% c. Calculate maximum geometrical range, with elevation = 0
el=0;
r_min_diff_GPS = sqrt( rObs.^2*(sind(el).^2-1) + r_GPS.^2) - rObs*sind(el)
r_min_diff_LEO = sqrt( rObs.^2*(sind(el).^2-1) + r_LEO.^2) - rObs*sind(el)

% e. Calculate doppler shift at elevation of 0
f_D_GPS = (v_GPS/c)*(R_E/r_GPS) * f_GPS
f_D_LEO = (v_LEO/c)*(R_E/r_LEO) * f_LEO

% g. Find if north pole can ever observe the LEO sat
z_LEO = 90-i_LEO;
z_GPS = 90-i_GPS;

z_max_LEO = atan2d(r_LEO*sind(z_LEO), r_LEO*cosd(z_LEO) - R_E)

z_max_GPS = atan2d(r_GPS*sind(z_GPS), r_GPS*cosd(z_GPS) - R_E)

el_LEO = 90-z_max_LEO

el_GPS = 90-z_max_GPS