%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW2 Part 1 Main Script

clc; clear; close all

% Reading in the sp3 files
sp3 = read_sp3('IGS0OPSFIN_20262310000_01D_15M_ORB.SP3');

% Graphing PRN X,Y,Z [m] against time (0-24 hours)

% a.
% Select data for PRN5 from SP3
[week_number_PRN5, TOW_s_PRN5, TOW_hr_PRN5, time_epoch_s_PRN5, time_epoch_hr_PRN5, X_m_PRN5, Y_m_PRN5, Z_m_PRN5, clock_bias_us_PRN5, constellation_PRN5] = extract_sp3_prn(sp3, 5);

figure()
plot(time_epoch_hr_PRN5,X_m_PRN5,'LineWidth',1.5)
hold on
plot(time_epoch_hr_PRN5,Y_m_PRN5,'LineWidth',1.5)
hold on
plot(time_epoch_hr_PRN5,Z_m_PRN5,'LineWidth',1.5)
title('PRN05 X,Y,Z Over time')
xlabel('Time [hrs]')
ylabel('Distance [m]')
grid on
hold on

% b. Using the almanac
[gps_ephem,gps_ephem_cell] = read_GPSyuma('YUMA231.alm.txt',2);


[health_PRN5,satPos_m_PRN5,satClkCorr_PRN5] = alm2pos(gps_ephem,[week_number_PRN5, TOW_s_PRN5] ,5);

plot(TOW_s_PRN5, satPos_m_PRN5, 'LineWidth',1.5)
legend('X SP3','Y SP3','Z SP3', 'X YUMA','Y YUMA','Z YUMA')

% c. Plot residuals
residuals_PRN5 = [satPos_m_PRN5(:,1)-X_m_PRN5,satPos_m_PRN5(:,2)-Y_m_PRN5,satPos_m_PRN5(:,3)-Z_m_PRN5];
figure()
plot(time_epoch_hr_PRN5,residuals_PRN5)
title('Difference Between SP3 and Almanac Results')
xlabel('Time [hr]')
ylabel('Difference [m]')
legend('X','Y','Z')
grid on

% TODO: Describe: yeah its stll pretty bad to be off by an order of 1000
% meters

% Export for PRN8 for part 3 as well
[week_number_PRN8, TOW_s_PRN8, TOW_hr_PRN8, time_epoch_s_PRN8, time_epoch_hr_PRN8, X_m_PRN8, Y_m_PRN8, Z_m_PRN8, clock_bias_us_PRN8, constellation_PRN8] = extract_sp3_prn(sp3, 8);

% Export this for part 3.
X_PRN5 = [X_m_PRN5,Y_m_PRN5,Z_m_PRN5];
X_PRN8 = [X_m_PRN8,Y_m_PRN8,Z_m_PRN8];
save("HW2Part1.mat", 'X_PRN5','TOW_s_PRN5', 'X_PRN5','TOW_s_PRN8', 'X_PRN8')