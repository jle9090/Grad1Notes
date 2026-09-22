%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW3 Part 2 Main Script
clc;clear;close all

% Use read clean to read in ephermides
clean_GPSbroadcast = read_clean_GPSbroadcast('brdc2310.26n', true);

% Read in sp3 ephem like HW2 
sp3 = read_sp3('IGS0OPSFIN_20262310000_01D_15M_ORB.SP3');
satPRN = extract_sp3_prn(sp3);

[health,satPos,satVel,satClkCorr] = eph2pvt2025(clean_GPSbroadcast, [satPRN(5).week_number satPRN(5).TOW_s], 5);

% Plotting ephemerides
figure()
plot(satPRN(5).TOW_hr, satPos, 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('X,Y,Z (m)')
title('Ephemerides')
grid on
legend('X','Y','Z')

% Plotting precise position 
figure()
plot(satPRN(5).TOW_hr, [satPRN(5).X_m,satPRN(5).Y_m,satPRN(5).Z_m], 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('X,Y,Z (m)')
title('Precise Position')
grid on
legend('X','Y','Z')

% Plotting residual
figure()
plot(satPRN(5).TOW_hr, [satPRN(5).X_m-satPos(:,1), satPRN(5).Y_m-satPos(:,2), satPRN(5).Z_m-satPos(:,3)], 'LineWidth', 1.5)
xlabel('Time (hrs)')
ylabel('X,Y,Z (m)')
title('Precise Position')
grid on
legend('X','Y','Z')

% c. Get satellite clock bias

% Get bias from ephem data

figure()
plot(satPRN(5).TOW_hr, satClkCorr)
xlabel('Time (hrs)')
ylabel('Clock Bias (m)')
grid on
title('Clock Bias Over Time')