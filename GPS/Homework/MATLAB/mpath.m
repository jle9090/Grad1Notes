function [MP1,CMC1] = mpath(rho_1, phi_1, f_1, phi_2, f_2)

c   = 2.99792458e8;    % SI speed of light, m/s
lambda_1 = c/f_1;
lambda_2 = c/f_2;

% L1C and L2W are the carrier phase of 1 and 2

% Mpath equations
MP1  = rho_1 - (f_1^2 + f_2^2)/(f_1^2 - f_2^2) .* phi_1*lambda_1 + (2*f_2^2)/(f_1^2 - f_2^2).* phi_2*lambda_2;
CMC1 = rho_1 - phi_1*lambda_1;

end