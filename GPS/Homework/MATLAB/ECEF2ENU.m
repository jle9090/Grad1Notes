function C_ECEF2ENU = ECEF2ENU(ref_lat_deg, ref_lon_deg)

phi = ref_lat_deg;
lambda = ref_lon_deg;

R1 = [1 0 0;
    0 cosd(90-phi) sind(90-phi);
    0 -sind(90-phi) cosd(90-phi)];

R2 = [-sind(lambda) cosd(lambda) 0;
    -cosd(lambda) -sind(lambda) 0;
    0 0 1];

C_ECEF2ENU = R1*R2;

end