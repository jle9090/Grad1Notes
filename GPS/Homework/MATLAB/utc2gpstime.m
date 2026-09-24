function [week_number, tow] = utc2gpstime(utc_datetime)
% Converts utc format to gps accounting for leapseconds as well

    gps_epoch = datetime(1980,1,6,0,0,0,'TimeZone','UTCLeapSeconds');
    gps_datetime = datetime(utc_datetime,'TimeZone','UTCLeapSeconds');

    seconds_since_gps_epoch = seconds(gps_datetime - gps_epoch);

    week_number = floor(seconds_since_gps_epoch/604800);
    tow = seconds_since_gps_epoch - week_number*604800;
end
