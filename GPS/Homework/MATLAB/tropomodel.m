function [tropo] = tropomodel(zd, elevation)
% 
% tropo= 1 / (sqrt(1-cosd(elevation)./(1.001)).^2 );

tropo = 1 ./ sqrt(1 - (cosd(elevation)/1.001).^2 );

end