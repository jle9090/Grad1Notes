function [PRIF12, iono] = ionocorr (C1C, f1, C2L, f2)

rho_1 = C1C;
rho_2 = C2L;

iono = ((f2^2)/(f1^2 - f2^2)) * (rho_2-rho_1);

PRIF12 = ((f1^2)/(f1^2 - f2^2))*rho_1 - ((f2^2)/(f1^2 - f2^2))*rho_2;

end