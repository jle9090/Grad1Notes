clc; clear; close all;

%Problem 1
rinexData = rinexread('NIST00USA_R_20262310000_01D_30S_MO.rnx');
rinexDataGPS = rinexData.GPS;

% Read in ephemeris
clean_GPSbroadcast = read_clean_GPSbroadcast('brdc2310.26n', true);

PRN_number3 = 3;

[PIF3,R13,EL3,AZ3,BSV3,RELAT3,TROP3,dPR4,satPos_ECEF_expected]=singlepointsolution(PRN_number3,rinexDataGPS,clean_GPSbroadcast);

fprintf('PIF, %.2s [m],  ',PIF3(1));


%Problem 2

%Part a

Sp=PIF3-dPR4;

%Part b

G=[(satPos_ECEF_expected-)]

