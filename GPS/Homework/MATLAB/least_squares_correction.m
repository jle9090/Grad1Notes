function [r_est, b_est, G, delta_rho_post, delta_r_f_ECEF, delta_r_f_ENU, HDOP, VDOP, iteration_count] = least_squares_correction(PRN_list, r_apriori_ECEF, NIST_ECEF, rinexDataGPS, ephemeris)
% Iterates the least squares point solution from an a priori position
% iter_log rows: [iter, |dx|, x, y, z, b]

% Inits
% Start from the a priori guess with no clock bias estimate
r_est = r_apriori_ECEF;
b_est = 0;
delta_threshold = Inf;
iter = 0;
iteration_count = 0;
while delta_threshold > 1E-2 % Solution converges under 1 cm
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

    iteration_count(iter,:) = [iter, delta_threshold, r_est, b_est];
end

% Find the delta r error from NIST
delta_r_f_ECEF = NIST_ECEF - r_est;

% Report delta_r_f_ENU
% Convert from ECEF to ENU
% Get ECEF to LLA
NIST_LLA = ecef2lla(NIST_ECEF);
lambda = NIST_LLA(2);
phi = NIST_LLA(1);
R_L = ECEF2ENU(phi,lambda);

delta_r_f_ENU = R_L*delta_r_f_ECEF';

% Compute HDOP and VDOP
% Since find H matrix, need G in ENU
R_tilde = blkdiag(R_L, 1); % accounting for clock bias part
G_ENU = G*R_tilde';

H_ENU = inv(G_ENU'*G_ENU);
HDOP = sqrt(H_ENU(1,1)+H_ENU(2,2));
VDOP = sqrt(H_ENU(3,3));

end
