function satPRN = extract_sp3_prn(sp3)
% Extract and filter SP3 data for any single PRN.
week_number = sp3(:,1);
TOW_s = sp3(:,2);
PRN = sp3(:,3);
X_m = sp3(:,4)*1000;
Y_m = sp3(:,5)*1000;
Z_m = sp3(:,6)*1000;
clock_bias_us = sp3(:,7);
constellation = sp3(:,8);
time_epoch_s = TOW_s;

%Filtering the PRN for all PRNs

for prn_index = 1:32

prn_select = PRN == prn_index;

week_number_prn = week_number(prn_select);
TOW_s_prn = TOW_s(prn_select);
TOW_hr_prn = TOW_s_prn/3600;
time_epoch_s_prn = time_epoch_s(prn_select);
time_epoch_hr_prn = time_epoch_s_prn;
X_m_prn = X_m(prn_select);
Y_m_prn = Y_m(prn_select);
Z_m_prn = Z_m(prn_select);
clock_bias_us_prn = clock_bias_us(prn_select);
constellation_prn = constellation(prn_select);
PRN_prn = PRN(prn_select);

% Insert into a struct to output for use of use

satPRN(prn_index) = struct(...
    'week_number', week_number_prn, ...
    'TOW_s', TOW_s_prn, ...
    'TOW_hr', TOW_hr_prn, ...
    'time_epoch_s', time_epoch_s_prn, ...
    'time_epoch_hr', time_epoch_hr_prn, ...
    'X_m', X_m_prn, ...
    'Y_m', Y_m_prn, ...
    'Z_m', Z_m_prn, ...
    'clock_bias_us', clock_bias_us_prn, ...
    'constellation', constellation_prn, ...
    'PRN', PRN_prn);

end

end
