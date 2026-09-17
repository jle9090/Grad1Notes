function [week_number_prn, TOW_s_prn, TOW_hr_prn, time_epoch_s_prn, time_epoch_hr_prn, X_m_prn, Y_m_prn, Z_m_prn, clock_bias_us_prn, constellation_prn] = extract_sp3_prn(sp3, prn)
% Extract and filter SP3 data for a single PRN.
week_number = sp3(:,1);
TOW_s = sp3(:,2);
PRN = sp3(:,3);
X_m = sp3(:,4)*1000;
Y_m = sp3(:,5)*1000;
Z_m = sp3(:,6)*1000;
clock_bias_us = sp3(:,7);
constellation = sp3(:,8);
time_epoch_s = TOW_s;

prn_id = PRN == prn;

week_number_prn = week_number(prn_id);
TOW_s_prn = TOW_s(prn_id);
TOW_hr_prn = TOW_s_prn/3600;
time_epoch_s_prn = time_epoch_s(prn_id);
time_epoch_hr_prn = time_epoch_s_prn;
X_m_prn = X_m(prn_id);
Y_m_prn = Y_m(prn_id);
Z_m_prn = Z_m(prn_id);
clock_bias_us_prn = clock_bias_us(prn_id);
constellation_prn = constellation(prn_id);

end
