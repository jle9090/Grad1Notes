function [PIF,R1,EL,AZ,BSV,RELAT,TROP,dPR4,satPos_ECEF_expected]=singlepointsolution(PRN_number,rinexDataGPS,clean_GPSbroadcast)


PRN_number = PRN_number;
PRN_index = rinexDataGPS.SatelliteID == PRN_number;
PRN_GPS_rinexData = rinexDataGPS(PRN_index,:);
PRN_GPS_rinexData(1,:) = []; % Kill first data point says Axelrad

% Reading in sp3
sp3 = read_sp3('IGS0OPSFIN_20262310000_01D_15M_ORB.SP3');
satPRN = extract_sp3_prn(sp3);

[NIST_GPS_week, NIST_GPS_TOW] = utc2gpstime(PRN_GPS_rinexData.Time);

NIST_ECEF = [-1288398.567 -4721696.932 4078625.350];

ephem_time_s = NIST_GPS_week.*604800 + NIST_GPS_TOW;
ephem_time_hr = ephem_time_s/3600;

gap_idx = [false; diff(ephem_time_s) > 1.5*median(diff(ephem_time_s))];

% Expected range corrected for light-time and Earth rotation
[R_expected, AZ_expected, EL_expected,satPos_ECEF_expected] = compute_expected_range(clean_GPSbroadcast, NIST_GPS_week, NIST_GPS_TOW, PRN_number, NIST_ECEF);
R_expected(gap_idx) = NaN;

% Find NIST time in hours
NIST_HR = NIST_GPS_week*604800 + NIST_GPS_TOW;

% Plotting satellite clock correction
[health,satPos,satVel,satClkCorr,~,~,relCorr] = eph2pvt2025(clean_GPSbroadcast, [NIST_GPS_week NIST_GPS_TOW], 14);

zd = 2;
tropo_correction  = tropomodel(zd, EL_expected);

f1 = 1575.42e6; % C1C frequency
f2 = 1227.6e6; % C2L frequency

% Calling ionospheric model
[PRIF, iono] = ionocorr (PRN_GPS_rinexData.C1C, f1, PRN_GPS_rinexData.C2L, f2);

PIF=PRIF;
R1=R_expected;
EL=EL_expected;
AZ=AZ_expected;
BSV=satClkCorr;
RELAT=relCorr;
TROP=tropo_correction;

dPR4 = PRIF - (R_expected - satClkCorr - relCorr + tropo_correction);

end