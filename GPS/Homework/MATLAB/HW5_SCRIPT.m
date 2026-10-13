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
NIST_ECEF = [-1288398.567 -4721696.932 4078625.350];
% PRN = 3;
% [PIF, R1, EL, AZ, BSV, RELAT, TROP] = singlepointsolution_spare(PRN,rinexDataGPS, ephemeris, NIST_ECEF);

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
% Computing prefit residuals
for PRN = PRN_list
    PRNid = sprintf('PRN%d', PRN); % e.g. delta_rho.PRN3
    delta_rho.(PRNid) = first.PIF.(PRNid) - (first.R1.(PRNid) - first.BSV.(PRNid) - first.RELAT.(PRNid) + first.TROP.(PRNid));
end
disp(delta_rho)

% Constructing G matrix
% Initial receiver position
x0 = NIST_ECEF(1);
y0 = NIST_ECEF(2);
z0 = NIST_ECEF(3);

% Satellite positions
xs = satPos_first(:,1);
ys = satPos_first(:,2);
zs = satPos_first(:,3);

% Finding R0
R0 = sqrt((xs - x0).^2 + (ys - y0).^2 + (zs - z0).^2);

% Geometry matrix
G = [-(xs - x0)./R0, -(ys - y0)./R0, -(zs - z0)./R0, ones(length(PRN_list),1)];
disp(G)

% Computing least squares solution
% Get structure into a vector
delta_rho = cell2mat(struct2cell(delta_rho));
dx_hat = (G'*G)\(G'*delta_rho);

delta_x = dx_hat(1);
delta_y = dx_hat(2);
delta_z = dx_hat(3);
delta_b = dx_hat(4);

disp(dx_hat)

% Compute post fit residuals
delta_rho_post = delta_rho - G*dx_hat;
disp(delta_rho_post)

% TODO: Redoing this without lower elevation sats/large postfit residuals