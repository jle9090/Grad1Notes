%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW2 Part 1 Main Script

clc; clear; close all

% Reading in the sp3 file
sp3 = read_sp3('IGS0OPSFIN_20262310000_01D_15M_ORB.SP3');

% Read entire spr for all prns and put into a struct
satPRN = extract_sp3_prn(sp3);

% Graphing PRN X,Y,Z [m] against time

% a.
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
legend('X SP3','Y SP3','Z SP3')
set(gcf, 'Units', 'inches', 'Position', [0 0 16 12]) % smaller physical size for the doc
exportgraphics(gcf, fullfile('figures', 'xyz_PRN5_sp3.png'), 'Resolution', 900);

% b. Using the almanac
[gps_ephem,gps_ephem_cell] = read_GPSyuma('YUMA231.alm.txt',2);


[health_PRN5,satPos_m_PRN5,satClkCorr_PRN5] = alm2pos(gps_ephem,[satPRN(5).week_number, satPRN(5).TOW_s] ,5);

plot(satPRN(5).TOW_s, satPos_m_PRN5, 'LineWidth',1.5)
legend('X SP3','Y SP3','Z SP3', 'X YUMA','Y YUMA','Z YUMA')
set(gcf, 'Units', 'inches', 'Position', [0 0 16 12])
exportgraphics(gcf, fullfile('figures', 'xyz_PRN5_sp3_almanac.png'), 'Resolution', 900);

% c. Plot residuals
residuals_PRN5 = [satPos_m_PRN5(:,1)-satPRN(5).X_m,satPos_m_PRN5(:,2)-satPRN(5).Y_m,satPos_m_PRN5(:,3)-satPRN(5).Z_m];
figure()
plot(satPRN(5).time_epoch_hr,residuals_PRN5, 'LineWidth', 1.5)
title('Difference Between SP3 and Almanac Results')
xlabel('Time [hr]')
ylabel('Difference [m]')
legend('X','Y','Z')
grid on
set(gcf, 'Units', 'inches', 'Position', [0 0 16 12])
exportgraphics(gcf, fullfile('figures', 'prn5_residuals.png'), 'Resolution', 900);

% TODO: Describe: yeah its stll pretty bad to be off by an order of 1000
% meters

% Export this for part 3.
save("HW2Part1.mat", 'satPRN')