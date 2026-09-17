%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW2 Part 1 Main Script

clc; clear; close all

% Reading in the sp3 files
sp3 = read_sp3('IGS0OPSFIN_20262310000_01D_15M_ORB.SP3');

% Extract every PRN up front and store in a struct array for ease of use.
for prn_number = 1:32
    [week_number, TOW_s, TOW_hr, time_epoch_s, time_epoch_hr, X_m, Y_m, Z_m, clock_bias_us, constellation, PRN] = extract_sp3_prn(sp3, prn_number);
    satPRN(prn_number) = struct('week_number', week_number, 'TOW_s', TOW_s, 'TOW_hr', TOW_hr, ...
        'time_epoch_s', time_epoch_s, 'time_epoch_hr', time_epoch_hr, 'X_m', X_m, 'Y_m', Y_m, 'Z_m', Z_m, ...
        'clock_bias_us', clock_bias_us, 'constellation', constellation, 'PRN', PRN);
end

% Graphing PRN X,Y,Z [m] against time (0-24 hours)

% a.
% Select data for PRN5 directly from satPRN
figure()
plot(satPRN(5).time_epoch_hr,satPRN(5).X_m,'LineWidth',1.5)
hold on
plot(satPRN(5).time_epoch_hr,satPRN(5).Y_m,'LineWidth',1.5)
hold on
plot(satPRN(5).time_epoch_hr,satPRN(5).Z_m,'LineWidth',1.5)
title('PRN05 X,Y,Z Over time')
xlabel('Time [hrs]')
ylabel('Distance [m]')
grid on
hold on

% b. Using the almanac
[gps_ephem,gps_ephem_cell] = read_GPSyuma('YUMA231.alm.txt',2);


[health_PRN5,satPos_m_PRN5,satClkCorr_PRN5] = alm2pos(gps_ephem,[satPRN(5).week_number, satPRN(5).TOW_s] ,5);

plot(satPRN(5).TOW_s, satPos_m_PRN5, 'LineWidth',1.5)
legend('X SP3','Y SP3','Z SP3', 'X YUMA','Y YUMA','Z YUMA')

% c. Plot residuals
residuals_PRN5 = [satPos_m_PRN5(:,1)-satPRN(5).X_m,satPos_m_PRN5(:,2)-satPRN(5).Y_m,satPos_m_PRN5(:,3)-satPRN(5).Z_m];
figure()
plot(satPRN(5).time_epoch_hr,residuals_PRN5, 'LineWidth', 1.5)
title('Difference Between SP3 and Almanac Results')
xlabel('Time [hr]')
ylabel('Difference [m]')
legend('X','Y','Z')
grid on

% TODO: Describe: yeah its stll pretty bad to be off by an order of 1000
% meters

% Export this for part 3.
save("HW2Part1.mat", 'satPRN')