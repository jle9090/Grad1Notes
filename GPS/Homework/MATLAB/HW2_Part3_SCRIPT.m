%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW2 Part 3 Main Script

clc; clear; close all

load("HW2Part1.mat")
load("HW2Part2.mat")

% Part a, write a function compute_azelrange, check with a simple source
% Force a satellite to be directly above NIST
[az_test, el_test, range_test] = compute_azelrange(ecef_NIST, 5*ecef_NIST,lat_NIST, lon_NIST)

% TODO: Explain that this is reasonable because elevation is ~90 degrees,
% directly over head which makes sense given the satellite being directly
% over head, range is also 5 times the magnitude of the NIST ecef vector which
% makes sense. 

% Part b, plot ECEF for user at NIST for PRN5
for i = 1:length(TOW_s_PRN5)
    [AZ(i),EL(i),RANGE(i)] = compute_azelrange(ecef_NIST, X_PRN5(i,:), lat_NIST, lon_NIST);
end

figure()
plot(TOW_s_PRN5, AZ, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Azimuth (deg)')
title('Azimuth vs TOW')
grid on

figure()
plot(TOW_s_PRN5, EL, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Elevation (deg)')
title('Elevation vs TOW')
grid on

figure()
plot(TOW_s_PRN5, RANGE, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Range (m)')
title('Range vs TOW (when Visible)')
grid on 

% C. Only plot when NIST can view the satellite

visibleIndices = EL>0;
TOW_s_PRN5_visible = TOW_s_PRN5(visibleIndices);
AZ_visible = AZ(visibleIndices);
EL_visible = EL(visibleIndices);
RANGE_visible = RANGE(visibleIndices);

figure()
plot(TOW_s_PRN5_visible, AZ_visible, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Azimuth (deg)')
title('Azimuth vs TOW (when Visible)')
grid on

figure()
plot(TOW_s_PRN5_visible, EL_visible, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Elevation (deg)')
title('Elevation vs TOW (when Visible)')
grid on

figure()
plot(TOW_s_PRN5_visible, RANGE_visible, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Range (m)')
title('Range vs TOW')
grid on 