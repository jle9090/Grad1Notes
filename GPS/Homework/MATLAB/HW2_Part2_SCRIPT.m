%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW2 Part 2 Main Script

clc; clear; close all
NIST = readtable('NIST_igs_station.csv');


% 3 User Positions in LLA

% NIST
lat_NIST = table2array(NIST(1,"Latitude"));
lon_NIST = table2array(NIST(1,"Longitude"));
height_m_NIST = table2array(NIST(1,"Height_m_"));

lla_NIST = [lat_NIST, lon_NIST, height_m_NIST];

% SMEAD
lat_SMEAD = 40.010389;
lon_SMEAD = -105.244278;
height_m_SMEAD = 1603.553;
N_SMEAD = geoidheight(lat_SMEAD,lon_SMEAD); % Accounting for geoid
height_m_SMEAD = height_m_SMEAD + N_SMEAD;

lla_SMEAD = [lat_SMEAD, lon_SMEAD, height_m_SMEAD];

% EQUATOR
lat_EQUATOR = 0;
lon_EQUATOR = lon_NIST;
height_m_EQUATOR = geoidheight(lat_EQUATOR,lon_EQUATOR); % this is wrong?

lla_EQUATOR = [lat_EQUATOR, lon_EQUATOR, height_m_EQUATOR];

% 3 User Positions in ECEF
% Convert to ECEF
ecef_NIST = lla2ecef(lla_NIST);
ecef_SMEAD = lla2ecef(lla_SMEAD);
ecef_EQUATOR = lla2ecef(lla_EQUATOR);

% Put into table for LLA and ECEF
Location = ["NIST"; "SMEAD"; "EQUATOR"];
Latitude_deg = [lat_NIST; lat_SMEAD; lat_EQUATOR];
Longitude_deg = [lon_NIST; lon_SMEAD; lon_EQUATOR];
Height_m = [height_m_NIST; height_m_SMEAD; height_m_EQUATOR];
X_m = [ecef_NIST(1); ecef_SMEAD(1); ecef_EQUATOR(1)];
Y_m = [ecef_NIST(2); ecef_SMEAD(2); ecef_EQUATOR(2)];
Z_m = [ecef_NIST(3); ecef_SMEAD(3); ecef_EQUATOR(3)];


%% im still pretty sure this is wrong...
for i = 1:length(Location)
    fprintf('%-8s Lat: %.6f  Lon: %.6f  Height: %.0f  X: %.0f  Y: %.0f  Z: %.0f\n', Location(i), Latitude_deg(i), Longitude_deg(i), Height_m(i), X_m(i), Y_m(i), Z_m(i));
end

