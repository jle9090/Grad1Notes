%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW3 Part 1 Main Script

clc; clear; close all

% Read rinex file

rinexData = rinexread('NIST00USA_R_20262310000_01D_30S_MO.rnx');

GPS_rinexData = rinexData.GPS;

% TODO: Call this to include NaNs for discontinous graphing
PRN_number = 5;
PRN_index = GPS_rinexData.SatelliteID == PRN_number;
PRN05_GPS_rinexData = GPS_rinexData(PRN_index,:);

% hihihihihihihihihihihihihihihihihihi

figure()
plot(PRN05_GPS_rinexData.Time, PRN05_GPS_rinexData.C1C)
xlabel('Time')
ylabel('C1C Pseudorange (m)')
title(sprintf('GPS PRN %d C1C Pseudorange', PRN_number))
grid minor

figure()
plot(PRN05_GPS_rinexData.Time, PRN05_GPS_rinexData.S1C)
xlabel('Time')
ylabel('SNR S1C')
title(sprintf('GPS PRN %d S1C Signal Strength', PRN_number))
grid minor

figure()
plot(PRN05_GPS_rinexData.Time, PRN05_GPS_rinexData.C1W)
xlabel('Time')
title(sprintf('GPS PRN %d C1W Pseudorange', PRN_number))
ylabel('C1W')
grid minor

figure()
plot(PRN05_GPS_rinexData.Time, PRN05_GPS_rinexData.D1C)
xlabel('Time')
title(sprintf('GPS PRN %d D1C Pseudorange', PRN_number))
ylabel('D1C')
grid minor