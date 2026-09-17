function [AZ, EL, RANGE] = compute_azelrange(userECEF, satECEF)
% satECEF is ECEF vector of sat
% userECEF is ECEF vector of the user

% Calculate LLA from userECEF
lla = ecef2lla(userECEF,'WGS84');
ref_lat = lla(1);
ref_lon = lla(2);
altitude = lla(3);
% Take difference of ECEF vectors, conver to ENU depending on ref angle
r_ECEF = satECEF-userECEF;

% Calculting range.
RANGE = sqrt(sum(r_ECEF.^2,2));

% Converting to ENU frame
r_ENU = (ECEF2ENU(ref_lat,ref_lon)*r_ECEF')';
x_E = r_ENU(:,1);
x_N = r_ENU(:,2);
x_U = r_ENU(:,3);

% Calclating azimuth and elevation
AZ = atan2d(x_E,x_N);
EL = asind(x_U./sqrt(sum(r_ENU.^2,2)));

end