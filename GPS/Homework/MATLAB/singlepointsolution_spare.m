function [PIF, R1, EL, AZ, BSV, RELAT, TROP] = singlepointsolution_spare(PRN,rinexDataGPS, ephemeris, user_ECEF)
% Using clock corrections, relativistic corrections, tropospheric
% corrections, ionospheriec corrections, output a pseudorange

% With PRN number a, extract rinex and ephemeris
PRN_number = PRN;
PRN_index = rinexDataGPS.SatelliteID == PRN_number;
PRN_GPS_rinexData = rinexDataGPS(PRN_index,:);

rho1 = rinexDataGPS.C1C;
rho2 = rinexDataGPS.C2W;
% f1 corresponds to rho1
% f2 corresponds to rho2
f1 = 1575.42e6; % C1 frequency
f2 = 1227.6e6; % C2 frequency
% f5 = 1176.45e6; % C5 frequency
% Finding ionosphere free pseudorange
[PIF, ~] = ionocorr (rho1, f1, rho2, f2);

% Finding expected range, azimuth, elevation
[GPS_week, GPS_TOW] = utc2gpstime(rinexDataGPS.Time);
[R1, AZ, EL] = compute_expected_range(ephemeris, GPS_week, GPS_TOW, PRN_number, user_ECEF);
R1(gap_idx) = NaN;

% Finding relative clock corrections
% Compute satellite clock bias and relativistic correction
[~,~,~,satClkCorr,~,~,relCorr] = eph2pvt2025(ephemeris, [GPS_week GPS_TOW], PRN_number);
BSV = satClkCorr;
RELAT = relCorr;

% Apply tropospheric correction using elevation and receiver position
% Assuming zd = 2 fixed for this assignment
zd = 2;
TROP  = tropomodel(zd, EL);
end
