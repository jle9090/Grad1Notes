function [G, dx_hat, delta_rho_post] = compute_least_point_solution(PRN_list, epoch_vals, satPos, user_ECEF)

%% Part 2 Calculate least square point solution
% Computing prefit residuals
for PRN = PRN_list
    PRNid = sprintf('PRN%d', PRN);
    delta_rho.(PRNid) = epoch_vals.PIF.(PRNid) - (epoch_vals.R1.(PRNid) - epoch_vals.BSV.(PRNid) - epoch_vals.RELAT.(PRNid) + epoch_vals.TROP.(PRNid));
end
disp(delta_rho)

% Constructing G matrix
% Initial receiver position
x0 = user_ECEF(1);
y0 = user_ECEF(2);
z0 = user_ECEF(3);

% Satellite positions
xs = satPos(:,1);
ys = satPos(:,2);
zs = satPos(:,3);

% Finding R0
R0 = sqrt((xs - x0).^2 + (ys - y0).^2 + (zs - z0).^2);

% Geometry matrix
G = [-(xs - x0)./R0, -(ys - y0)./R0, -(zs - z0)./R0, ones(length(PRN_list),1)];
disp('G Matrix')
disp(G)

% Computing least squares solution
% Get structure into a vector
delta_rho = cell2mat(struct2cell(delta_rho));
dx_hat = (G'*G)\(G'*delta_rho);

delta_x = dx_hat(1);
delta_y = dx_hat(2);
delta_z = dx_hat(3);
delta_b = dx_hat(4);

disp('Least Squares Solution')
disp(dx_hat)

% Compute post fit residuals
delta_rho_post = delta_rho - G*dx_hat;
disp('Post Fit Residuals')
disp(delta_rho_post)
end