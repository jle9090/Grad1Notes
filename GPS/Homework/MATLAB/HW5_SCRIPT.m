%% ASEN 5090 GPS/GNSS
%% Justin Le
%% HW5 Main Script
clc;clear;close all

%% Reading in data
% Reading in rinex
rinexData = rinexread('NIST00USA_R_20262310000_01D_30S_MO.rnx');
rinexDataGPS = rinexData.GPS;

% Read in ephemeris
ephemeris = read_clean_GPSbroadcast('brdc2310.26n', true);

%% Part 1 Filling out table
disp('<strong>Part 1</strong>')
NIST_ECEF = [-1288398.567 -4721696.932 4078625.350];

PRN_list = [3,4,7,8,9,16,26,27,31];
for PRN = PRN_list
    PRNid = sprintf('PRN%d', PRN);
    [PIF.(PRNid), R1.(PRNid), EL.(PRNid), AZ.(PRNid), BSV.(PRNid), RELAT.(PRNid), TROP.(PRNid), SATPOS.(PRNid)] = singlepointsolution(PRN,rinexDataGPS, ephemeris, NIST_ECEF);
end

% Obtain only the very first values and put in a struct, also the first sat
% pos for G matrix
first_vals = zeros(length(PRN_list), 7);
satPos_first = zeros(length(PRN_list), 3);
for i = 1:length(PRN_list)
    PRNid = sprintf('PRN%d', PRN_list(i));
    first_vals(i,:) = [PIF.(PRNid)(1), R1.(PRNid)(1), EL.(PRNid)(1), AZ.(PRNid)(1), BSV.(PRNid)(1), RELAT.(PRNid)(1), TROP.(PRNid)(1)];
    satPos_first(i,:) = SATPOS.(PRNid)(1,:);

    first.PIF.(PRNid) = PIF.(PRNid)(1);
    first.R1.(PRNid) = R1.(PRNid)(1);
    first.EL.(PRNid) = EL.(PRNid)(1);
    first.AZ.(PRNid) = AZ.(PRNid)(1);
    first.BSV.(PRNid) = BSV.(PRNid)(1);
    first.RELAT.(PRNid) = RELAT.(PRNid)(1);
    first.TROP.(PRNid) = TROP.(PRNid)(1);
end
first_val_table = array2table(first_vals, 'VariableNames', {'PIF','R1','EL','AZ','BSV','RELAT','TROP'}, ...
    'RowNames', compose('PRN%d', PRN_list'));
disp(first_val_table)

%% Part 2 Calculate least square point solution
disp('<strong>Part 2</strong>')
[G, dx_hat, delta_rho_post] = compute_least_point_solution(PRN_list, first, satPos_first, NIST_ECEF);

% Redoing this without lower elevation sats/large postfit residuals
% Removing low elevation, PRN8
% Removing large postfit residuals, PRN3, PRN27

post_PRN_list = [4,7,9,16,26,31];
for PRN = post_PRN_list
    PRNid = sprintf('PRN%d', PRN);
    [PIF.(PRNid), R1.(PRNid), EL.(PRNid), AZ.(PRNid), BSV.(PRNid), RELAT.(PRNid), TROP.(PRNid), SATPOS.(PRNid)] = singlepointsolution(PRN,rinexDataGPS, ephemeris, NIST_ECEF);
end

disp('<strong>Part 2 adjusting PRNs</strong>')
% Obtain only the very first values and put in a struct, also the first sat
% pos for G matrix
first_vals = zeros(length(post_PRN_list), 7);
satPos_first = zeros(length(post_PRN_list), 3);
for i = 1:length(post_PRN_list)
    PRNid = sprintf('PRN%d', post_PRN_list(i));
    first_vals(i,:) = [PIF.(PRNid)(1), R1.(PRNid)(1), EL.(PRNid)(1), AZ.(PRNid)(1), BSV.(PRNid)(1), RELAT.(PRNid)(1), TROP.(PRNid)(1)];
    satPos_first(i,:) = SATPOS.(PRNid)(1,:);

    first.PIF.(PRNid) = PIF.(PRNid)(1);
    first.R1.(PRNid) = R1.(PRNid)(1);
    first.EL.(PRNid) = EL.(PRNid)(1);
    first.AZ.(PRNid) = AZ.(PRNid)(1);
    first.BSV.(PRNid) = BSV.(PRNid)(1);
    first.RELAT.(PRNid) = RELAT.(PRNid)(1);
    first.TROP.(PRNid) = TROP.(PRNid)(1);
end
first_val_table = array2table(first_vals, 'VariableNames', {'PIF','R1','EL','AZ','BSV','RELAT','TROP'}, ...
    'RowNames', compose('PRN%d', post_PRN_list'));
disp(first_val_table)

[G, dx_hat, delta_rho_post] = compute_least_point_solution(post_PRN_list, first, satPos_first, NIST_ECEF);


%% Part 3
disp('<strong>Part 3</strong>')
% given an initial guess
r0_ECEF = lla2ecef([40,-105,1600],'WGS84');

% Error vector
delta_r0 = NIST_ECEF - r0_ECEF;

% Finding straightline 
disp('<strong>Striaght line error</strong>')
disp(norm(delta_r0))

% b. Find state vector corrections
PRN_list = [3,4,7,8,9,16,26,27,31];
for PRN = PRN_list
    PRNid = sprintf('PRN%d', PRN);
    [PIF.(PRNid), R1.(PRNid), EL.(PRNid), AZ.(PRNid), BSV.(PRNid), RELAT.(PRNid), TROP.(PRNid), SATPOS.(PRNid)] = singlepointsolution(PRN,rinexDataGPS, ephemeris, NIST_ECEF);
end

% Obtain only the very first values and put in a struct, also the first sat
% pos for G matrix
first_vals = zeros(length(PRN_list), 7);
satPos_first = zeros(length(PRN_list), 3);
for i = 1:length(PRN_list)
    PRNid = sprintf('PRN%d', PRN_list(i));
    first_vals(i,:) = [PIF.(PRNid)(1), R1.(PRNid)(1), EL.(PRNid)(1), AZ.(PRNid)(1), BSV.(PRNid)(1), RELAT.(PRNid)(1), TROP.(PRNid)(1)];
    satPos_first(i,:) = SATPOS.(PRNid)(1,:);

    first.PIF.(PRNid) = PIF.(PRNid)(1);
    first.R1.(PRNid) = R1.(PRNid)(1);
    first.EL.(PRNid) = EL.(PRNid)(1);
    first.AZ.(PRNid) = AZ.(PRNid)(1);
    first.BSV.(PRNid) = BSV.(PRNid)(1);
    first.RELAT.(PRNid) = RELAT.(PRNid)(1);
    first.TROP.(PRNid) = TROP.(PRNid)(1);
end
first_val_table = array2table(first_vals, 'VariableNames', {'PIF','R1','EL','AZ','BSV','RELAT','TROP'}, ...
    'RowNames', compose('PRN%d', PRN_list'));

[G, dx_hat, delta_rho_post] = compute_least_point_solution(PRN_list, first, satPos_first, r0_ECEF);

% c. Update estimate from state estimate corrections
r1_ECEF = r0_ECEF + dx_hat(1:3)';
delta_r1 = NIST_ECEF - r1_ECEF;
disp('<strong>Striaght line error</strong>')
disp(norm(delta_r0))
disp(norm(delta_r1))

% d. Iterate
% Initial delta, start from the a priori guess with no clock bias estimate
r_est = r0_ECEF;
b_est = 0;
delta_threshold = Inf;
iter = 0;
while delta_threshold > 1E-2
    iter = iter + 1;

    % a priori position recompute table values at current estimate
    for PRN = PRN_list
        PRNid = sprintf('PRN%d', PRN);
        [PIF.(PRNid), R1.(PRNid), EL.(PRNid), AZ.(PRNid), BSV.(PRNid), RELAT.(PRNid), TROP.(PRNid), SATPOS.(PRNid)] = singlepointsolution(PRN,rinexDataGPS, ephemeris, r_est);
    end
    for i = 1:length(PRN_list)
        PRNid = sprintf('PRN%d', PRN_list(i));
        satPos_first(i,:) = SATPOS.(PRNid)(1,:);
        first.PIF.(PRNid) = PIF.(PRNid)(1) - b_est; % Remove clock bias
        first.R1.(PRNid) = R1.(PRNid)(1);
        first.BSV.(PRNid) = BSV.(PRNid)(1);
        first.RELAT.(PRNid) = RELAT.(PRNid)(1);
        first.TROP.(PRNid) = TROP.(PRNid)(1);
    end

    [G, dx_hat, delta_rho_post] = compute_least_point_solution(PRN_list, first, satPos_first, r_est);

    % Update position and clock bias estimates
    r_est = r_est + dx_hat(1:3)';
    b_est = b_est + dx_hat(4);
    delta_threshold = norm(dx_hat);

    fprintf('Iter %d: |dx| = %.2f m, r = [%.2f, %.2f, %.2f] m, bsv = %.2f\n', iter, delta_threshold, r_est,b_est);
end

% Find the delta r error from NIST
delta_r_f_ECEF = NIST_ECEF - r_est;
disp('<strong>delta_r_f ECEF</strong>')
disp(delta_r_f_ECEF)

% Display the postfit residuals as well
disp('<strong>Postfit Residuals</strong>')
disp(delta_rho_post) %they do not seem to change much?

% Report delta_r_f_ENU
% Convert from ECEF to ENU
% Get ECEF to LLA
NIST_LLA = ecef2lla(NIST_ECEF);
lambda = NIST_LLA(2);
phi = NIST_LLA(1);
R_L = [-sind(lambda), cosd(lambda), 0;
    -sind(phi)*cosd(lambda), -sind(phi)*sind(lambda), cosd(phi);
    cosd(phi)*cosd(lambda), cosd(phi)*sind(lambda), sind(phi)];

delta_r_f_ENU = R_L*delta_r_f_ECEF';

disp('<strong>delta_r_f ENU</strong>')
disp(delta_r_f_ENU)
