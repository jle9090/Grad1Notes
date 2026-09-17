%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW2 Part 3 Main Script

clc; clear; close all

load("HW2Part1.mat")
load("HW2Part2.mat")

% Part a, write a function compute_azelrange, check with a simple source
% Force a satellite to be directly above NIST
[az_test, el_test, range_test] = compute_azelrange(ecef_NIST, 5*ecef_NIST)

% TODO: Explain that this is reasonable because elevation is ~90 degrees,
% directly over head which makes sense given the satellite being directly
% over head, range is also 5 times the magnitude of the NIST ecef vector which
% makes sense. 

% Part b, plot ECEF for user at NIST for PRN5
for i = 1:length(satPRN(5).TOW_s)
    [AZ_PRN5(i),EL_PRN5(i),RANGE_PRN5(i)] = compute_azelrange(ecef_NIST, [satPRN(5).X_m(i), satPRN(5).Y_m(i), satPRN(5).Z_m(i)]);
end

figure()
plot(satPRN(5).TOW_s, AZ_PRN5, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Azimuth (deg)')
title('Azimuth vs TOW')
grid on

figure()
plot(satPRN(5).TOW_s, EL_PRN5, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Elevation (deg)')
title('Elevation vs TOW')
grid on

figure()
plot(satPRN(5).TOW_s, RANGE_PRN5, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Range (m)')
title('Range vs TOW (when Visible)')
grid on

% C. Only plot when NIST can view the satellite

visibleIndices_PRN5 = EL_PRN5>0;
TOW_s_PRN5_visible = satPRN(5).TOW_s;
AZ_PRN5_visible = AZ_PRN5; AZ_PRN5_visible(~visibleIndices_PRN5) = NaN;
EL_PRN5_visible = EL_PRN5; EL_PRN5_visible(~visibleIndices_PRN5) = NaN;
RANGE_PRN5_visible = RANGE_PRN5; RANGE_PRN5_visible(~visibleIndices_PRN5) = NaN;

figure()
plot(TOW_s_PRN5_visible, AZ_PRN5_visible, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Azimuth (deg)')
title('Azimuth vs TOW (when Visible)')
grid on

figure()
plot(TOW_s_PRN5_visible, EL_PRN5_visible, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Elevation (deg)')
title('Elevation vs TOW (when Visible)')
grid on

figure()
plot(TOW_s_PRN5_visible, RANGE_PRN5_visible, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Range (m)')
title('Range vs TOW')
grid on

% d. Repeat for PRN 8

for i = 1:length(satPRN(8).TOW_s)
    [AZ_PRN8(i),EL_PRN8(i),RANGE_PRN8(i)] = compute_azelrange(ecef_NIST, [satPRN(8).X_m(i), satPRN(8).Y_m(i), satPRN(8).Z_m(i)]);
end

figure()
plot(satPRN(8).TOW_s, AZ_PRN8, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Azimuth (deg)')
title('Azimuth vs TOW (PRN 8)')
grid on

figure()
plot(satPRN(8).TOW_s, EL_PRN8, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Elevation (deg)')
title('Elevation vs TOW (PRN 8)')
grid on

figure()
plot(satPRN(8).TOW_s, RANGE_PRN8, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Range (m)')
title('Range vs TOW (PRN 8, when Visible)')
grid on

% Only plot when NIST can view the satellite

visibleIndices_PRN8 = EL_PRN8>0;
TOW_s_PRN8_visible = satPRN(8).TOW_s;
AZ_PRN8_visible = AZ_PRN8; AZ_PRN8_visible(~visibleIndices_PRN8) = NaN;
EL_PRN8_visible = EL_PRN8; EL_PRN8_visible(~visibleIndices_PRN8) = NaN;
RANGE_PRN8_visible = RANGE_PRN8; RANGE_PRN8_visible(~visibleIndices_PRN8) = NaN;

figure()
plot(TOW_s_PRN8_visible, AZ_PRN8_visible, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Azimuth (deg)')
title('Azimuth vs TOW (PRN 8, when Visible)')
grid on

figure()
plot(TOW_s_PRN8_visible, EL_PRN8_visible, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Elevation (deg)')
title('Elevation vs TOW (PRN 8, when Visible)')
grid on

figure()
plot(TOW_s_PRN8_visible, RANGE_PRN8_visible, 'LineWidth', 1.5)
xlabel('TOW (S)')
ylabel('Range (m)')
title('Range vs TOW (PRN 8, when Visible)')
grid on

% Part 4: skyplots
% Calculate visibility for all PRNs at NIST
for prn = 1:32
    for i = 1:length(satPRN(prn).TOW_s)
        [satPRN(prn).AZ(i), satPRN(prn).EL(i), satPRN(prn).RANGE(i)] = compute_azelrange(ecef_NIST, [satPRN(prn).X_m(i), satPRN(prn).Y_m(i), satPRN(prn).Z_m(i)]);
    end
    visibleIndices = satPRN(prn).EL > 0;
    satPRN(prn).AZ_visible = satPRN(prn).AZ; satPRN(prn).AZ_visible(~visibleIndices) = NaN;
    satPRN(prn).EL_visible = satPRN(prn).EL; satPRN(prn).EL_visible(~visibleIndices) = NaN;
end

figure()
for prn = 1:32
    plotAzEl(satPRN(prn).AZ_visible, satPRN(prn).EL_visible, satPRN(prn).PRN)
    hold on
end
title('Skyplot at NIST')

% Recalculate and plot for the two other sites

% SMEAD
for prn = 1:32
    for i = 1:length(satPRN(prn).TOW_s)
        [satPRN(prn).AZ(i), satPRN(prn).EL(i), satPRN(prn).RANGE(i)] = compute_azelrange(ecef_SMEAD, [satPRN(prn).X_m(i), satPRN(prn).Y_m(i), satPRN(prn).Z_m(i)]);
    end
    visibleIndices = satPRN(prn).EL > 0;
    satPRN(prn).AZ_visible = satPRN(prn).AZ; satPRN(prn).AZ_visible(~visibleIndices) = NaN;
    satPRN(prn).EL_visible = satPRN(prn).EL; satPRN(prn).EL_visible(~visibleIndices) = NaN;
end

figure()
for prn = 1:32
    plotAzEl(satPRN(prn).AZ_visible, satPRN(prn).EL_visible, satPRN(prn).PRN)
    hold on
end
title('Skyplot at SMEAD')

% EQUATOR
for prn = 1:32
    for i = 1:length(satPRN(prn).TOW_s)
        [satPRN(prn).AZ(i), satPRN(prn).EL(i), satPRN(prn).RANGE(i)] = compute_azelrange(ecef_EQUATOR, [satPRN(prn).X_m(i), satPRN(prn).Y_m(i), satPRN(prn).Z_m(i)]);
    end
    visibleIndices = satPRN(prn).EL > 0;
    satPRN(prn).AZ_visible = satPRN(prn).AZ; satPRN(prn).AZ_visible(~visibleIndices) = NaN;
    satPRN(prn).EL_visible = satPRN(prn).EL; satPRN(prn).EL_visible(~visibleIndices) = NaN;
end

figure()
for prn = 1:32
    plotAzEl(satPRN(prn).AZ_visible, satPRN(prn).EL_visible, satPRN(prn).PRN)
    hold on
end
title('Skyplot at NIST')