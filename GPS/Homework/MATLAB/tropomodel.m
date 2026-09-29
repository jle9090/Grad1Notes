function [tropo] = tropomodel(zd, elevation)

% TODO: check model, this is currently a mapping function I think?

tropo = zd * (1 ./ sqrt(1 - (cosd(elevation)/1.001).^2 ));

end